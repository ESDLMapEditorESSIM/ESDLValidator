import json

from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "connected_to")
class ContainsConnectedTo(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "connected_to",
            "Check if an asset is connected to",
            [
                ArgDefinition("assetType", "The type of asset to which selected asset must be connected to", True),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        msg = {"offending_asset": self.value.id}
        for port in self.value.port:
            for connected_port in port.connectedTo:
                if connected_port.energyasset.__class__.__name__ not in self.args['assetType']:
                    result = "{} cannot be connected to {}".format(self.value.id, connected_port.energyasset.id)
                    if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                        msg["message"] = result
                        return CheckResult(False, msg)
                    else:
                        return CheckResult(False, result)

        return CheckResult(True)
