from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import (
    FunctionFactory,
    FunctionCheck,
    FunctionDefinition,
    ArgDefinition,
    FunctionType,
    CheckResult,
)


@FunctionFactory.register(FunctionType.CHECK, "attributes_not_null")
class AttributesNotSet(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "attributes_not_null",
            "Check if attributes or nested reference attributes are all set (not as a default value or count_as_null value).",
            [
                ArgDefinition(
                    "checks",
                    "A list of dictionaries with structure as {attribute: str, count_as_null: list[Any]} to be checked" \
                    "count_as_null can be an empty list.",
                    True,
                ),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False),
            ],
        )

    def execute(self):
        value = self.value
        msg = {"offending_asset": self.value.id}

        checks = utils.get_attribute(self.args, "checks")

        if not isinstance(checks, list):
            raise TypeError(f"Invalid function argument. Argument 'checks' should be a list, got {type(checks)}.")

        results = []
        for dict in checks:
            if "attribute" not in dict or "count_as_null" not in dict:
                raise ValueError("Missing required keys: 'attribute' and/or 'count_as_null'.")

            attr = dict["attribute"]
            count_as_null = dict["count_as_null"]

            if not isinstance(attr, str):
                raise TypeError("'attribute' must be a string")
            if not isinstance(count_as_null, list):
                raise TypeError("'count_as_null' must be a list")

            attr_value = utils.get_attr_or_ref_attr(value, attr)
            if attr_value == "Not found":
                raise ValueError(f"Attribute [{attr}] not found.")
            elif attr_value == "Unset":
                results.append(f"[{attr}] value should be defined.")
            else:
                # Handle the case when attribute value is set, but should still be considered as unset.
                for nullValue in count_as_null:
                    if (isinstance(nullValue, str) and str(nullValue).lower() == str(attr_value).lower()) or (
                        nullValue == attr_value
                    ):
                        r = f"[{attr}] value cannot be {nullValue}."
                        results.append(r)
                        break

        if len(results) > 0:
            if "resultMsgJSON" in self.args and self.args["resultMsgJSON"]:
                msg["message"] = results
                return CheckResult(False, msg)
            else:
                return CheckResult(False, results)
        else:
            return CheckResult(True)
