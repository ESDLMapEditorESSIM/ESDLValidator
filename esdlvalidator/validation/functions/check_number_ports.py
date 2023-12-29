import json

from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "number_ports")
class ContainsXNumberPorts(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "number_ports",
            "Check the number of ports available",
            [
                ArgDefinition("number", "Display output in JSON format", True),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        msg = {"offending_asset": self.value.id}
        if len(self.value.port) < self.args["number"]:
            result = f"{self.value.id} has less than {self.args['number']} ports"
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)
        elif len(self.value.port) > self.args["number"]:
            result = f"{self.value.id} has more than {self.args['number']} ports"
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

        return CheckResult(True)
