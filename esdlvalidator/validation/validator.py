from esdlvalidator.core.esdl import utils

from esdlvalidator.validation.validator_esdl import EsdlValidator
from esdlvalidator.validation.validator_xsd import XsdValidator
from esdlvalidator.validation.validator_result import ValidatorResult


class Validator:
    """Validator to check ESDL files"""

    def __init__(self):
        self.__esdlValidator = EsdlValidator()
        self.__xsdValidator = XsdValidator()

    def validate(self, esdlString, schemas: "list[str]", validateXsd: bool):
        """Validator to ESDL against xsd and user schemas

        Args:
            esdlString str: String containing the ESDL contents
            schemas list[str]: Schemas in string format to check against
            validateXsd bool: If the validator should check against xsd

        Returns:
            result ValidatorResult: containing the validator results
        """

        esdl = self.__load_esdl(esdlString)
        xsdResult = None if validateXsd == False else self.__xsdValidator.validate(esdlString)
        esdlResult = self.__esdlValidator.validate(esdl, schemas)
        result = ValidatorResult(xsdResult, esdlResult)
        return result

    def __load_esdl(self, esdlString: str):
        """Get the string of the uploaded file, load it as energy system handler and return the resource"""

        esh = utils.get_esh_from_string(esdlString)
        return esh.resource
