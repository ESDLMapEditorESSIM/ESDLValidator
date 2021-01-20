from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "in_range")
class ContainsNotNull(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "in_range",
            "Check if a property value is in range (value >= min or value <= max)",
            [
                ArgDefinition("property", "The name of the propery to check if it is in range of definef min and max", True),
                ArgDefinition("min", "Minimum value of the range", True),
                ArgDefinition("max", "Maximum value of the range", True)
            ]
        )

    def execute(self):
        self.set_values()

        if not utils.has_attribute(self.value, self.property):
            return CheckResult(False, "Property {0} not found".format(self.property))

        propertyValue = utils.get_attribute(self.value, self.property)
        inRange = self.is_in_range(self.min, self.max, propertyValue)
        return CheckResult(True) if inRange else CheckResult(False, "value {0} falls outside of range {1}-{2}".format(propertyValue, self.min, self.max))

    def set_values(self):
        self.property = utils.get_attribute(self.args, "property")
        self.min = utils.get_attribute(self.args, "min")
        self.max = utils.get_attribute(self.args, "max")

    def is_in_range(self, min, max, value):
        return True if value >= min and value <= max else False
