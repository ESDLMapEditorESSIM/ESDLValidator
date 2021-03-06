import logging
import copy

from esdlvalidator.validation.functions.function import CheckResult, FunctionFactory, FunctionType

from esdlvalidator.validation.validator_esdl_validation_result import EsdlValidationResults
from esdlvalidator.validation.validator_esdl_schema_result import EsdlSchemaResult
from esdlvalidator.validation.validator_esdl_result import EsdlResult

logger = logging.getLogger(__name__)


class EsdlValidator:
    """Validate a loaded ESDL against one or multiple validation schemas"""

    def __init__(self):
        pass

    def validate(self, esdl, schemas: list):
        """Validate an ESDL against one or more multiple schemas

        Args:
            esdl (object): The loaded ESDL

        Returns:
            result: EsdlResult containing the validation results
        """

        schemaResults = []
        for schema in schemas:
            schemaResult = self.__run_schema(schema, esdl)
            schemaResults.append(schemaResult)

        result = EsdlResult(schemaResults)
        return result

    def __run_schema(self, schema, esdl):
        validationResults = []

        # schema can consist of multiple validations
        for validation in schema["validations"]:
            validationResult = self.__run_validation(validation, esdl)
            validationResults.append(validationResult)

        schemaResult = EsdlSchemaResult(schema, validationResults)

        return schemaResult

    def __run_validation(self, validation, esdl):
        selects = validation["selects"]
        check = validation["check"]
        datasets = self.__constructDatasets(selects, esdl)
        checkResults = self.__run_check(check, datasets)
        validationResult = EsdlValidationResults(validation, checkResults)

        return validationResult

    def __constructDatasets(self, selects, esdl):
        datasets = {"resource": esdl}

        for s in selects:
            select = self.__run_select(s, datasets)
            datasets[select.alias] = select.result

        return datasets

    def __run_select(self, select, datasets):
        select = FunctionFactory.create(FunctionType.SELECT, select["function"], alias=select["alias"], datasets=datasets, args=select["args"])
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
            checkResult = self.__run_get_check_result(cleanCheck, datasets, entry)
            checkResults.append(checkResult)
            logger.debug("check done, result: {0}".format(checkResult.result.ok))
            logger.debug("-------------------------")

        return checkResults

    def __run_get_check_result(self, check, datasets, entry):
        functionName = check["function"]
        args = check["args"]
        logger.debug("check entry: {0}, function: '{1}', args: {2}".format(entry.__class__.__name__, functionName, args))

        checkResult = FunctionFactory.create(FunctionType.CHECK, functionName, datasets=datasets, value=entry, args=args)
        andList = check["and"] if "and" in check else None
        orList = check["or"] if "or" in check else None

        # result is ok and no 'and' found
        if checkResult.result.ok == True and andList is None:
            logger.debug("result == True, and no 'and' options found")
            return checkResult

        # result is not ok and there is no or
        if checkResult.result.ok == False and orList is None:
            logger.debug("result == False, no 'or' options found, returning result")
            return checkResult

        # result is ok but there are more and's defined
        if checkResult.result.ok == True and andList is not None:
            logger.debug("result == True 'and' options found")
            andFailed = False
            for a in andList:
                checkResult = self.__run_get_check_result(a, datasets, entry)
                if checkResult.result.ok == False:
                    andFailed = True
                    break

            # and resulted in ok == false and there is no or
            if andFailed == True and orList is None:
                logger.debug("and is not ok, no 'or' options found, returning result")
                return checkResult

        # result is not ok but there are or's defined
        if checkResult.result.ok == False and orList is not None:
            logger.debug("executing 'or' function")
            orSuccess = False
            for o in orList:
                checkResult = self.__run_get_check_result(o, datasets, entry)
                if checkResult.result.ok == True:
                    orSuccess = True
                    break

            if orSuccess == True:
                logger.debug("result == True, returning result")
                return checkResult

        return checkResult
