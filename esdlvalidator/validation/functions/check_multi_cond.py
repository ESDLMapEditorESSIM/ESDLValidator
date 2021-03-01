import json
from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "multi_cond")
class ContainsMultiConditionCheck(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "multi_cond",
            "Check if a combination of properties of an asset are in violation (AND-condition)",
            [
                ArgDefinition("properties", "The properties that need to checked", True),
                ArgDefinition("violations", "The property values to check against", True),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        msg = utils.create_offending_asset_msg(self.value)
        if "properties" not in self.args or "violations" not in self.args:
            result = "Bad Schema: Either properties or violations missing from schema for this check"
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)
        if len(self.args["properties"]) != len(self.args["violations"]):
            result = "Bad Schema: Number of properties don't match number of violations"
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

        fail = True
        for i in range(0, len(self.args["properties"])):
            p = self.args["properties"][i]
            v = self.args["violations"][i]
            if not utils.has_attribute(self.value, p):
                result = "property {0} not found".format(p)
                if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                    msg["message"] = result
                    return CheckResult(False, msg)
                else:
                    return CheckResult(False, result)

            fail = fail and (str(utils.get_attribute(self.value, p)) == str(v))

        if fail:
            result = "One of {} must be defined".format(" or ".join(self.args['properties']))
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)
        return CheckResult(True)
