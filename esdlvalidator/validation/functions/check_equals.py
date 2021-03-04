

from pyecore.ecore import EOrderedSet

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "equals")
class CheckEquals(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "equals",
            "Check if a value equals another value",
            [
                ArgDefinition("property", "The name of the propery containing the value to check, leave propery out to check directly on input value", False),
                ArgDefinition("values", "List or single value to check against", True),
            ]
        )

    def execute(self):
        value = self.value

        hasProp = utils.has_attribute(self.args, "property")
        prop = utils.get_attribute(self.args, "property", None)
        values = utils.get_attribute(self.args, "values")
        if not isinstance(values, list):
            values = [values]

        if hasProp:
            if not utils.has_attribute(value, prop):
                return CheckResult(False, "property {0} not found".format(prop))

            value = utils.get_attribute(value, prop)

        if isinstance(value, EOrderedSet):
            value = value.items[0]

        for v in values:
            test = str(value).lower()
            if str(v).lower() == str(value).lower():
                return CheckResult(True, "")

        return CheckResult(False, "Property {0} with value {1} does not equal: {2}".format(prop, value, ', '.join(map(str, values))))
