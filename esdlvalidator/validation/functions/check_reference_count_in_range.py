from typing import Iterable
from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult

@FunctionFactory.register(FunctionType.CHECK, "reference_count_in_range")
class ReferenceCountInRange(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "reference_count_in_range",
            "Check if the entity has a reference count in the specified range or matching a list of allowed counts. "
            "Use 'min'/'max' for a continuous range, or 'allowed_counts' for a discrete set of valid values (e.g. [2, 4]). "
            "If 'allowed_counts' is provided it takes priority over 'min'/'max'.",
            [
                ArgDefinition("referenceType", "An iterable reference type to be checked", True),
                ArgDefinition("min", "Minimum value of the range (used when 'allowed_counts' is not specified)", False),
                ArgDefinition("max", "Maximum value of the range (used when 'allowed_counts' is not specified)", False),
                ArgDefinition("allowed_counts", "A list of integers representing the only valid reference counts (e.g. [2, 4])", False),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )


    def execute(self):

        referenceType = self.args["referenceType"]
        if not isinstance(referenceType, str):
            raise TypeError(f"Invalid function argument. Argument 'referenceType' should be a string, got {type(referenceType)}")

        allowed_counts = self.args.get("allowed_counts")
        min_val = self.args.get("min")
        max_val = self.args.get("max")

        if allowed_counts is None and (min_val is None or max_val is None):
            raise ValueError("Either 'allowed_counts' or both 'min' and 'max' must be specified.")

        if allowed_counts is not None:
            if not isinstance(allowed_counts, list) or not all(isinstance(v, int) for v in allowed_counts):
                raise TypeError(f"Invalid function argument. 'allowed_counts' must be a list of integers, got {allowed_counts}")
        else:
            if not isinstance(min_val, int) or not isinstance(max_val, int):
                raise TypeError(f"Invalid function argument. Argument 'min' and 'max' must be integers, got {type(min_val)}, {type(max_val)}")

        r = utils.get_attribute(self.value, referenceType)
        if r is None:
            raise ValueError(f"{self.value.name} (id: {self.value.id}) has no reference '{referenceType}'")
        if not isinstance(r, Iterable):
            raise TypeError(f"Reference '{referenceType}' is not iterable")

        count = len(r)
        msg = None

        if allowed_counts is not None:
            if count not in allowed_counts:
                allowed_str = ", ".join(str(v) for v in allowed_counts)
                msg = f"{self.value.name} (id: {self.value.id}) has ({count}) [{referenceType}], but expected one of [{allowed_str}]"
        else:
            if count > max_val:
                msg = f"{self.value.name} (id: {self.value.id}) has ({count}) [{referenceType}], more than the allowed maximum ({max_val})"
            elif count < min_val:
                msg = f"{self.value.name} (id: {self.value.id}) has ({count}) [{referenceType}], less than the allowed minimum ({min_val})"

        if msg:
            if self.args.get("resultMsgJSON"):
                result = { "offending_asset": self.value.id, "message": msg }
                return CheckResult(False, result)
            else:
                return CheckResult(False, msg)

        return CheckResult(True)
