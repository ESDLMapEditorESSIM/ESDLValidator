import json
from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "check_child_attribute")
class ContainsNotConnectedTo(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "check_child_attribute",
            "Check if asset component has attribute",
            [
                ArgDefinition("component", "The child component containing the attribute", True),
                ArgDefinition("attribute", "The attribute that needs to checked", True),
                ArgDefinition("check_all", "Whether to check any or all component attribute exist", False),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        msg = {"offending_asset": self.value.id}

        components = []
        if hasattr(self.value, self.args["component"]):
            components = getattr(self.value, self.args["component"])
            if components is None:
                components = []

        if len(components) == 0:
            result = "{} has no components of type {}".format(self.value.id, self.args["component"])
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

        if 'check_all' in self.args and not isinstance(self.args['check_all'], bool):
            result = "Bad Schema: check_all must be a boolean, but is {} instead".format(type(self.args['check_all']))
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

        if 'check_all' in self.args and self.args['check_all']:
            for item in components:
                attr = utils.get_attribute(item, self.args["attribute"])
                if attr is None or len(attr) == 0:
                    result = "{} is missing attribute {} in component {} of type {}".format(self.value.id,
                                                                                            self.args["attribute"],
                                                                                            item.id,
                                                                                            self.args["component"])
                    if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                        msg["message"] = result
                        return CheckResult(False, msg)
                    else:
                        return CheckResult(False, result)
            return CheckResult(True)

        else:
            for item in components:
                attr = utils.get_attribute(item, self.args["attribute"])
                if attr is not None and len(attr) > 0:
                    return CheckResult(True)
            result = "{} does not have at least one component {} containing attribute {}".format(self.value.id,
                                                                                                 self.args["component"],
                                                                                                 self.args["attribute"])
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)
