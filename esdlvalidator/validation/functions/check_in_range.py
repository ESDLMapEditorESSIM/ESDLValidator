from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "in_range")
class ContainsNotNull(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "in_range",
            "Check if a property value is in range (value >= min or value <= max)",
            [
                ArgDefinition("property", "The name of the propery to check if it is in range of definef min and max",
                              True),
                ArgDefinition("min", "Minimum value of the range", True),
                ArgDefinition("max", "Maximum value of the range", True),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def execute(self):
        self.set_values()
        msg = utils.create_offending_asset_msg(self.value)

        if not utils.has_attribute(self.value, self.property):
            result = "Property {0} not found".format(self.property)
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

        propertyValue = utils.get_attribute(self.value, self.property)
        inRange = self.is_in_range(self.min, self.max, propertyValue)
        if inRange:
            return CheckResult(True)
        else:
            result = "value {0} falls outside of range {1}-{2}".format(propertyValue, self.min, self.max)
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

    def set_values(self):
        self.property = utils.get_attribute(self.args, "property")
        self.min = utils.get_attribute(self.args, "min")
        self.max = utils.get_attribute(self.args, "max")

    def is_in_range(self, min, max, value):
        return True if value >= min and value <= max else False
