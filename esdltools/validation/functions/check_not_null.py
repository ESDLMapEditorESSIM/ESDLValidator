from numbers import Number

from esdltools.validation.functions import utils
from esdltools.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "not_null")
class ContainsNotNull(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "not_null",
            "Check if a value is set",
            [
                ArgDefinition("property", "The name of the propery containing the value to check, leave propery out to check directly on input value", False),
                ArgDefinition("counts_as_null", "Array of values which are seen as null values such as 0.0 for a double, 0 for int, 'NULL' for a string", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        prop, propertySet = utils.get_args_property(self.args, "property")
        include, _ = utils.get_args_property(self.args, "counts_as_null", [])    

        # Some esdl entity values have a default of undefined or none when not set
        include.extend(["undefined", "none"])
        value = self.value

        if propertySet:
            if not hasattr(value, prop):
                msg = "property {0} not found".format(prop)
                if hasattr(value, "id"):
                    msg += " for entity {0}".format(getattr(value, "id"))

                return CheckResult(False, msg)
            
            value = getattr(value, prop)
        
        if value is None:
            return CheckResult(False)
        
        return self.check_includes(include, value)

    def check_includes(self, include, value):
        for includeValue in include:
            if str(includeValue).lower() == str(value).lower():
                return CheckResult(False, "value equals {0}".format(includeValue))

        return CheckResult(True)
