from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "attributes_not_null")
class AttributesNotSet(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "attributes_not_null",
            "Check if required attributes are all set (not null).",
            [
                ArgDefinition("checks", "A list of dictionaries with structure as {attribute: str, count_as_null: list[Any]} to be checked", True),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def execute(self):
        value = self.value
        msg = {"offending_asset": self.value.id}

        checks = utils.get_attribute(self.args, "checks")

        if not isinstance(checks, list):
            raise TypeError(f"Invalid function argument. Argument 'checks' should be a list, got {type(checks)}.")
        
        results = []
        for dict in checks:
            if 'attribute' not in dict or 'count_as_null' not in dict:
                raise ValueError("Missing required keys: 'attribute' and/or 'count_as_null'.")
            
            attr = dict['attribute']
            count_as_null = dict['count_as_null']

            if not isinstance(attr, str):
                raise TypeError("'attribute' must be a string")
            if not isinstance(count_as_null, list):
                raise TypeError("'count_as_null' must be a list")
        
            if not utils.has_attribute(value, attr):
                r = f"Attribute '{attr}' not found."
                results.append(r)
            else:
                # if attribute and value is set, eIsSet() returns True
                attrValueIsSet = self.value.eIsSet(attr)

                if not attrValueIsSet:
                    r = f"Attribute value of '{attr}' should be defined."
                    results.append(r)
                # Handle the case when attribute value is set, but should still be considered as undefined.
                else:
                    attrValue = utils.get_attribute(value, attr)

                    for nullValue in count_as_null:
                        if (isinstance(nullValue, str) and str(nullValue).lower() == str(attrValue).lower()) \
                            or (nullValue == attrValue):
                            # TODO: more explicit message?
                            r = f"'{attr}' value cannot be null."
                            results.append(r)
                            break

        if len(results) > 0:
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = "; ".join(results)
                return CheckResult(False, msg)
            else:
                return CheckResult(False, results)
        else:
            return CheckResult(True)