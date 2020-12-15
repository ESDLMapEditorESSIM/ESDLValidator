from esdltools.validation.repository import SchemaRepository
from esdltools.validation.functions.function import FunctionFactory, FunctionType

from esdltools.validation.validator_validation_result import ValidationResults
from esdltools.validation.validator_schema_result import SchemaResult

class EsdlValidator:
    """Validate a loaded ESDL against one or multiple validation schemas"""

    def __init__(self):
        pass
    
    def validate(self, esdl, schemas):
        """Validate an ESDL against one or more multiple schamas

        Args:
            esdl (object): The loaded ESDL

        Returns:
            result: JSON response containing the results of the validation
        """

        schemaResults = []
        for schema in schemas:
            schemaResult = self.__run_schema(schema, esdl)
            schemaResults.append(schemaResult)

        # construct result json
        return schemaResults

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
        dataset = check["dataset"]
        checkResults = []

        if not isinstance(dataset, list):
            dataset = [dataset]
        
        for entry in dataset:
            checkResult = FunctionFactory.create(FunctionType.CHECK, check["function"], datasets=datasets, value=entry, args=check["args"])
            checkResults.append(checkResult)

        return checkResults

    def __construct_response(self, schemaResults):
        pass