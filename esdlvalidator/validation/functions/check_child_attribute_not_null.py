import json
from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "check_child_attribute_not_null")
class ContainsNotConnectedTo(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "check_child_attribute_not_null",
            "Check if asset component has attribute",
            [
                ArgDefinition("component", "The child component containing the attribute", True),
                ArgDefinition("attribute", "The attributes that needs to checked", True),
                ArgDefinition("value", "Which check subattribute", True),
                ArgDefinition("unit_type", "Which unit type to check", False),
                ArgDefinition("unit", "Unit to compare it to", False),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        msg = {"offending_asset": self.value.id}

        components = None
        if hasattr(self.value, self.args["component"]):
            components = getattr(self.value, self.args["component"])

        if components is None:
            result = "{} has no components of type {}".format(self.value.id, self.args["component"])
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

        attr = None
        if hasattr(components, self.args["attribute"]):
            attr = getattr(components, self.args["attribute"])

        if attr is None:
            result = "{} has no components of type {}".format(self.value.id, self.args["attribute"])
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

        value = getattr(attr, "value")

        qau = getattr(attr, 'profileQuantityAndUnit')
        if isinstance(self.args["unit_type"], list):
            if len(self.args["unit_type"]) == len(self.args["unit"]):
                resultcheck = self.check_units(self.args["attribute"], qau)
                if not resultcheck.ok:
                    return resultcheck
                # for i in range(0,len(self.args["unit_type"])):
                #     unittype = getattr(qau, self.args["unit_type"][i])
                #     unit = self.args["unit"][i]
                #     self.check_includes(unit, attr, unittype, self.value)
            else:
                result = "Bad Schema: Number of unit_types don't match number of units"
                if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                    msg["message"] = result
                    return CheckResult(False, msg)
                else:
                    return CheckResult(False, result)

        return self.check_includes("0.0", attr, value, self.value)

    def check_includes(self, include, prop, value, originalValue):
        msg = {"offending_asset": self.value.id}
        for includeValue in include:
            if isinstance(value, list):
                ret = []
                for v in value:
                    ret.append(self.check_includes(include, prop, v, originalValue))
                for r in ret:
                    if not r.ok:
                        return r
            elif str(includeValue).lower() == str(value).lower():
                result = self.__create_message("{0} cannot be null".format(prop), originalValue)
                if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                    msg["message"] = result
                    return CheckResult(False, msg)
                else:
                    return CheckResult(False, result)

        return CheckResult(True)

    def check_units(self, prop, qau):
        correct = 0
        msg = {"offending_asset": self.value.id}
        for i in range(0, len(self.args["unit_type"])):
            unittype = getattr(qau, self.args["unit_type"][i])
            unit = self.args["unit"][i]
            if str(unittype.name).lower() == str(unit).lower():
                correct += 1
        if correct != len(self.args["unit_type"]):
            result = self.__create_message("{0} should contain {1} of type {2}".format(prop, self.args["unit_type"],
                self.args["unit"]), self.value)
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

