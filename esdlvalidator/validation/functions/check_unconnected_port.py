from esdlvalidator.validation.functions.function import (
    FunctionFactory,
    FunctionCheck,
    FunctionDefinition,
    ArgDefinition,
    FunctionType,
    CheckResult,
)


@FunctionFactory.register(FunctionType.CHECK, "unconnected_port")
class ContainsNotConnectedTo(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "unconnected_port",
            "Check if ports in any asset are left unconnected",
            [
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ],
        )

    def before_execute(self):
        pass

    def execute(self):
        results = []

        if len(self.value.port) == 0:
            results.append(f"{self.value.id} has no ports.")
        else:
            for port in self.value.port:
                if len(port.connectedTo) == 0:
                    results.append(f"{port.__class__.__name__} (name: {port.name}) is unconnected.")

        if len(results) > 0:
            if self.args.get("resultMsgJSON"):
                msg = {"offending_asset": self.value.id, "message": results}
                return CheckResult(False, msg)
            else:
                return CheckResult(False, results)
        else:
            return CheckResult(True)
