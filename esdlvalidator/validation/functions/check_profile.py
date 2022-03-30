import json
from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "check_profile")
class ContainsNotConnectedTo(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "check_profile",
            "Check if asset has at least one profile attached to its ports",
            [
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        msg = {"offending_asset": self.value.id}
        if len(self.value.port) == 0:
            result = "{} has no ports".format(self.value.id)
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

        for port in self.value.port:
            if len(utils.get_attribute(port, "profile")) > 0:
                return CheckResult(True)

        result = "{} does not have at least one profile".format(self.value.id)
        if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
            msg["message"] = result
            return CheckResult(False, msg)
        else:
            return CheckResult(False, result)
