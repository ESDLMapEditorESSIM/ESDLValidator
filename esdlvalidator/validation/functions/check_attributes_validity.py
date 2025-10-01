from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import (
    FunctionFactory,
    FunctionCheck,
    FunctionDefinition,
    ArgDefinition,
    FunctionType,
    CheckResult,
)


@FunctionFactory.register(FunctionType.CHECK, "attributes_are_valid")
class AttributesNotSet(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "attributes_are_valid",
            "Check if attribute(s) or nested reference attribute(s) value matches the value(s) in count_as_valid."
            "Currently, only string type is supported, but can be extended to support other types.",
            [
                ArgDefinition(
                    "reference_path",
                    "A dot-separated string representing the reference path. For instance, costInformation.investmentCosts"
                    "If an empty string is given, it refers to the parent entity.",
                    True,
                ),
                ArgDefinition(
                    "checks",
                    "A list of dictionaries with structure as {attribute: str, count_as_valid: str | list[str]} to be checked."
                    "Use 'Unset' as count_as_valid value to indicate the attribute should stay unset (null).",
                    True,
                ),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False),
            ],
        )

    def execute(self):
        value = self.value
        msg = {"offending_asset": self.value.id}

        reference_path = utils.get_attribute(self.args, "reference_path")
        checks = utils.get_attribute(self.args, "checks")

        results = []
        unset_keyword = "Unset"

        if not isinstance(reference_path, str):
            raise TypeError(
                f"Invalid function argument. Argument 'reference_path' should be a string, got {type(checks)}."
            )

        if not isinstance(checks, list):
            raise TypeError(f"Invalid function argument. Argument 'checks' should be a list, got {type(checks)}.")

        for dict in checks:
            if "attribute" not in dict or "count_as_valid" not in dict:
                raise ValueError("Missing required keys: 'attribute' and/or 'count_as_valid'.")

            attr = dict["attribute"]
            count_as_valid = dict["count_as_valid"]

            if not isinstance(attr, str):
                raise TypeError(f"'attribute' must be a string, got {type(attr)}.")

            if isinstance(count_as_valid, str):
                count_as_valid = [count_as_valid]

            if not all(isinstance(item, str) for item in count_as_valid):
                raise TypeError("'count_as_valid' must be a list of strings")

            attr_path = f"{reference_path}.{attr}" if reference_path else attr
            attr_value = utils.get_attr_or_ref_attr(value, attr_path)

            if attr_value == "Not found":
                raise ValueError(f"Attribute [{attr}] not found.")

            if attr_value == unset_keyword:
                if unset_keyword not in count_as_valid:
                    results.append(
                        f"[{attr}] should be {'one of ' if len(count_as_valid) > 1 else ''}[{', '.join(count_as_valid)}], but is unset."
                    )
            else:
                attr_value = getattr(attr_value, "name", str(attr_value))
                if attr_value.lower() not in [v.lower() for v in count_as_valid]:
                    results.append(
                        f"[{attr}] shoul be {'one of ' if len(count_as_valid) > 1 else ''}[{', '.join(count_as_valid)}], but found [{attr_value}]."
                    )

        if len(results) > 0:
            if self.args.get("resultMsgJSON"):
                msg["message"] = results
                return CheckResult(False, msg)
            else:
                return CheckResult(False, results)
        else:
            return CheckResult(True)
