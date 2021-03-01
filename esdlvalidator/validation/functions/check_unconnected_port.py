import json

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "unconnected_port")
class ContainsNotConnectedTo(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "unconnected_port",
            "Check if a port in any asset is left unconnected",
            [
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        msg = utils.create_offending_asset_msg(self.value)
        if len(self.value.port) == 0:
            result = "{} has no ports".format(self.value.id)
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)
        for port in self.value.port:
            if len(port.connectedTo) == 0:
                result = "{}'s {} is unconnected".format(self.value.id, port.__class__.__name__)
                if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                    msg["message"] = result
                    return CheckResult(False, msg)
                else:
                    return CheckResult(False, result)

        return CheckResult(True)
