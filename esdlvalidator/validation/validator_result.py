import json

from esdlvalidator.validation.validator_esdl_result import EsdlResult
from esdlvalidator.validation.validator_xsd_results import XsdResult


class ValidatorResult:
    """Result of a validation, this is returned to the user as JSON"""

    def __init__(self, xsdResult: XsdResult, esdlResult: EsdlResult):
        if xsdResult is not None:
            self.xsdValidation = xsdResult
        if esdlResult is not None:
            self.esdlValidation = esdlResult

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__, sort_keys=False, indent=4)
