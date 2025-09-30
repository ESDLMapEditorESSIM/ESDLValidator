import logging
import copy
import os
from concurrent import futures
from concurrent.futures.thread import ThreadPoolExecutor
from threading import Barrier

from esdlvalidator.validation.functions.function import CheckResult, FunctionFactory, FunctionType

from esdlvalidator.validation.validator_validation_result import ValidationResults
from esdlvalidator.validation.validator_schema_result import SchemaResult
from esdlvalidator.validation.validator_result import ValidatorResult

logger = logging.getLogger(__name__)


class EsdlValidator:
    """Validate a loaded ESDL against one or multiple validation schemas"""

    def __init__(self):
        pass

    def validate(self, esdl, schemas: list) -> ValidatorResult:
        """Validate an ESDL against one or more multiple schemas

        Args:
            esdl (object): The loaded ESDL
            schemas (list): A list of validation schemas

        Returns:
            result: ValidatorResult containing the validation results
        """

        schemaResults = []
        for schema in schemas:
            schemaResult = self.__run_schema(schema, esdl)
            schemaResults.append(schemaResult)

        result = ValidatorResult(schemaResults)
        return result

    def __run_schema(self, schema, esdl):
        validationResults = []

        # schema can consist of multiple validations
        for validation in schema["validations"]:
            validationResult = self.__run_validation(validation, esdl)
            validationResults.append(validationResult)

        schemaResult = SchemaResult(schema, validationResults)

        return schemaResult

    def __run_validation(self, validation, esdl):
        selects = validation["selects"]
        check = validation["check"]
        datasets = self.__constructDatasets(selects, esdl)
        checkResults = self.__run_check(check, datasets)
        validationResult = ValidationResults(validation, checkResults)

        return validationResult

    def __constructDatasets(self, selects, esdl):
        datasets = {"resource": esdl}

        for s in selects:
            select = self.__run_select(s, datasets)
            datasets[select.alias] = select.result

        return datasets

    def __run_select(self, select, datasets):
        select = FunctionFactory.create(
            FunctionType.SELECT, select["function"], alias=select["alias"], datasets=datasets, args=select["args"]
        )
        return select

    def __run_check(self, check, datasets):
        datasetName = check["dataset"]
        dataset = datasets[datasetName]
        checkResults = []

        if not isinstance(dataset, (frozenset, list, set, tuple)):
            dataset = [dataset]

        logger.debug("running checks for {0} found entries in dataset '{1}'".format(len(dataset), datasetName))

        for entry in dataset:
            cleanCheck = copy.deepcopy(check)
            check_results = self.__run_get_check_result(cleanCheck, datasets, entry)
            checkResults.extend(check_results)
            logger.debug("check done")
            logger.debug("-------------------------")

        return checkResults

    def __run_get_check_result(self, check, datasets, entry):
        """
        Return a list of checkResult(s) for the given check function.

        Rules:
        - If the check passes and no AND/OR → return [checkResult].
        - If AND conditions fail and no OR → return failed AND results.
        - If OR condition rescues → return [successful OR checkResult].
        - If overall failure → return failed results (including base check, failed ANDs, failed ORs).
        """
        functionName = check["function"]
        args = check["args"]
        logger.debug(
            "check entry: {0}, function: '{1}', args: {2}".format(entry.__class__.__name__, functionName, args)
        )

        checkResult = FunctionFactory.create(
            FunctionType.CHECK, functionName, datasets=datasets, value=entry, args=args
        )
        andList = check.get("and", [])
        orList = check.get("or", [])

        # -----------------------
        # Helper: evaluate OR
        # -----------------------
        def evaluate_or():
            failed, success = [], None
            for o in orList:
                subResults = self.__run_get_check_result(o, datasets, entry)
                for sr in subResults:
                    if sr.result.ok:
                        success = sr
                        break
                if success:
                    break
                failed.extend(subResults)
            return success, failed

        if checkResult.result.ok:
            # Check ANDs
            failed_and = []
            for a in andList:
                subResults = self.__run_get_check_result(a, datasets, entry)
                failed_and.extend([sr for sr in subResults if not sr.result.ok])

            if not failed_and and not orList:
                return [checkResult]  # All good, no AND/OR
            if failed_and and not orList:
                return failed_and  # AND failed, no OR to rescue

            # OR evaluation
            or_success, failed_or = evaluate_or()
            if or_success:
                return [or_success]  # Rescued by OR
            return failed_and + failed_or

        else:  # checkResult failed
            failed_results = [checkResult]

            # OR evaluation
            or_success, failed_or = evaluate_or()
            if or_success:
                return [or_success]  # Rescued by OR
            failed_results.extend(failed_or)

            # Check ANDs
            for a in andList:
                subResults = self.__run_get_check_result(a, datasets, entry)
                failed_results.extend([sr for sr in subResults if not sr.result.ok])

            return failed_results
