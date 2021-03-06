from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "not_connected_to")
class ContainsNotConnectedTo(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "not_connected_to",
            "Check if an asset is not connected to",
            [
                ArgDefinition("assetType", "The type of asset to which selected asset must not be connected to", True),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        msg = utils.create_offending_asset_msg(self.value)
        for port in self.value.port:
            for connected_port in port.connectedTo:
                if connected_port.energyasset.__class__.__name__ == self.args['assetType']:
                    result = "{} cannot be connected to {}".format(self.value.id, connected_port.energyasset.id)
                    if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                        msg["message"] = result
                        return CheckResult(False, msg)
                    else:
                        return CheckResult(False, result)

        return CheckResult(True)
