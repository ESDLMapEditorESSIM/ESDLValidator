from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "not_null")
class ContainsNotNull(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "not_null",
            "Check if a value is set",
            [
                ArgDefinition("property", "The name of the propery containing the value to check, leave propery out to check directly on input value", False),
                ArgDefinition("counts_as_null", "Array of values which are seen as null values such as 0.0 for a double, 0 for int, 'NULL' for a string", False),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        hasProp = utils.has_attribute(self.args, "property")
        prop = utils.get_attribute(self.args, "property", None)
        include = utils.get_attribute(self.args, "counts_as_null", [])

        # Some esdl entity values have a default of undefined or none when not set
        include.extend(["undefined", "none"])
        value = self.value
        msg = {"offending_asset": self.value.id}

        if hasProp:
            if not utils.has_attribute(value, prop):
                result = self.__create_message("property {0} not found".format(prop), value)
                if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                    msg["message"] = result
                    return CheckResult(False, msg)
                else:
                    return CheckResult(False, result)

            value = utils.get_attribute(value, prop)

        if value is None:
            result = self.__create_message("property {0} value is None".format(prop), value)
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

        return self.check_includes(include, prop, value, self.value)

    def check_includes(self, include, prop, value, originalValue):
        msg = {"offending_asset": self.value.id}
        for includeValue in include:
            if str(includeValue).lower() == str(value).lower():
                result = self.__create_message("{0} cannot be {1}".format(prop, includeValue), originalValue)
                if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                    msg["message"] = result
                    return CheckResult(False, msg)
                else:
                    return CheckResult(False, result)

        return CheckResult(True)

    def __create_message(self, msg, value):
        if utils.has_attribute(value, "id"):
            msg += " for entity {0}".format(utils.get_attribute(value, "id"))
        return msg
