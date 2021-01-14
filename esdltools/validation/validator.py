from esdltools.validation.repository import SchemaRepository
from esdltools.validation.functions.function import FunctionFactory, FunctionType

from esdltools.validation.validator_validation_result import ValidationResults
from esdltools.validation.validator_schema_result import SchemaResult
from esdltools.validation.validator_result import ValidatorResult


class EsdlValidator:
    """Validate a loaded ESDL against one or multiple validation schemas"""

    def __init__(self):
        pass

    def validate(self, esdl, schemas: list):
        """Validate an ESDL against one or more multiple schemas

        Args:
            esdl (object): The loaded ESDL

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
        select = FunctionFactory.create(FunctionType.SELECT, select["function"], alias=select["alias"], datasets=datasets, args=select["args"])
        return select

    def __run_check(self, check, datasets):
        dataset = datasets[check["dataset"]]
        checkResults = []

        print("totaal {0}".format(len(dataset)))

        if not isinstance(dataset, (frozenset, list, set, tuple)):
            dataset = [dataset]

        for entry in dataset:
            checkResult = FunctionFactory.create(FunctionType.CHECK, check["function"], datasets=datasets, value=entry, args=check["args"])
            checkResults.append(checkResult)

        return checkResults
