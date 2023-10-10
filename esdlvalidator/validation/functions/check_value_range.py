from esdlvalidator.core.esdl import utils as esdlUtils
from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "check_value_range")
class ContainsNumberAssets(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "check_value_range",
            "Check the number of assets",
            [
                ArgDefinition("min_value", "The min number of assets that should be present", True),
                ArgDefinition("max_value", "The max number of assets that should be present", True),
                ArgDefinition("message", "Part of message to be added", False),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        msg = {}
        self.min = utils.get_attribute(self.args, "min_value")
        self.max = utils.get_attribute(self.args, "max_value")
        if self.value<self.min:
            msg["message"] = utils.get_attribute(self.args, "message") + "to few assets present"
            return CheckResult(False, msg)
        elif self.value>self.max:
            msg["message"] = utils.get_attribute(self.args, "message") + "to many assets present"
            return CheckResult(False, msg)

        return CheckResult(True)
