from typing import Iterable
from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "reference_count_in_range")
class ReferenceCountInRange(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "reference_count_in_range",
            "Check if the entity has a reference count in the specified range",
            [
                ArgDefinition("referenceType", "An iterable reference type to be checked", True),
                ArgDefinition("min", "Minimum value of the range", True),
                ArgDefinition("max", "Maximum value of the range", True),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )


    def execute(self):

        referenceType = self.args["referenceType"]
        if not isinstance(referenceType, str):
            raise ValueError(f"Invalid function argument. Argument 'referenceType' should be a string, got {type(referenceType)}")
        
        min = self.args["min"]
        max = self.args["max"]
        if not isinstance(min, int) or not isinstance(max, int):
            raise ValueError(f"Invalid function argument. Argument 'min' or 'max' should be an integer, got {type(min)}, {type(max)}")

        r = utils.get_attribute(self.value, referenceType)
        if r is None:
            raise ValueError(f"{self.value.id} ({self.value.name}) has no reference '{referenceType}'")
        if not isinstance(r, Iterable):
            raise ValueError(f"Reference '{referenceType}' is not iterable")
        
        msg = None
        if len(r) > max:
            msg = f"{self.value.id} ({self.value.name}) has {len(r)} {referenceType}, more than the allowed maximum ({max})"
        elif len(r) < min:
            msg = f"{self.value.id} ({self.value.name}) has {len(r)} {referenceType}, less than the allowed minimum ({min})"

        if msg:
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                result = { "offending_asset": self.value.id, "message": msg }
                return CheckResult(False, result)
            else:
                return CheckResult(False, msg)

        return CheckResult(True)
