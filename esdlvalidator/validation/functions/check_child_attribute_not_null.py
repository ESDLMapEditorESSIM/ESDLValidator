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
                ArgDefinition("check_type", "Checking for existence or values: exists/value/both", True),
                ArgDefinition("unit_type", "Which unit type to check", False),
                ArgDefinition("unit", "Unit to compare it to", False),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        msg = {"offending_asset": self.value.id}
        exist_check = False # only error messaging for relevant checks
        value_check = False
        unit_check = False

        if self.args["check_type"] == "exists" or self.args["check_type"] == "both":
            exist_check = True
        if self.args["check_type"] == "unit" or self.args["check_type"] == "both":
            unit_check = True
        if self.args["check_type"] == "value":
            value_check = True

        if isinstance(self.args["attribute"], list) and value_check:
            result = ("Not allowed to check multiple attributes if also values and units of attributes are "
                      "checked")
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

        components = None
        if hasattr(self.value, self.args["component"]):
            components = getattr(self.value, self.args["component"])

        if components is None:
            if exist_check:
                result = "{} has no components of type {} with the attributes {}".format(self.value.id, self.args[
                    "component"], self.args["attribute"])
                if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                    msg["message"] = result
                    return CheckResult(False, msg)
                else:
                    return CheckResult(False, result)
            else:
                CheckResult(True) #no checking of values and units required if no cost information exists



        if isinstance(self.args["attribute"], list):
            attr_list = []
            for attribute in self.args["attribute"]:
                attr = None
                if hasattr(components, attribute):
                    attr = getattr(components, attribute)
                if attr is None:
                    attr_list.append(attribute)
            if len(attr_list)==0:
                return CheckResult(True)
            else:
                result = "{} has no components of type {} with the attributes {}".format(self.value.id,
                                                                                         self.args["component"],
                                                                                         attr_list)
                if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                    msg["message"] = result
                    return CheckResult(False, msg)
                else:
                    return CheckResult(False, result)
        else:
            attr = None
            if type(components).__name__ == "EOrderedSet" and len(components)==1:
                components = components[0]
            if hasattr(components, self.args["attribute"]):
                attr = getattr(components, self.args["attribute"])
            if attr is None:
                if exist_check:
                    result = "{} has no components of type {} with the attributes {}".format(self.value.id,
                                                                                             self.args["component"],
                                                                                             self.args["attribute"])
                    if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                        msg["message"] = result
                        return CheckResult(False, msg)
                    else:
                        return CheckResult(False, result)
                else:
                    return CheckResult(True) #no checking of values and units required if no cost information
                    # attribute exists

        if value_check:
            if isinstance(attr, float):
                value = attr
            else:
                value = getattr(attr, "value")
            if value == 0.0:
                result = "{} has a component of type {} with the attributes {} at 0".format(self.value.id,
                                                                                             self.args["component"],
                                                                                             self.args["attribute"])
                if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                    msg["message"] = result
                    return CheckResult(False, msg)
                else:
                    return CheckResult(False, result)

        if unit_check:
            value = getattr(attr, "value")
            qau = getattr(attr, 'profileQuantityAndUnit')

            if isinstance(self.args["unit_type"], list):
                if len(self.args["unit_type"]) == len(self.args["unit"]):
                    resultcheck = self.check_units(self.args["attribute"], qau)
                    if not resultcheck.ok:
                        return resultcheck
                else:
                    result = "Bad Schema: Number of unit_types don't match number of units"
                    if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                        msg["message"] = result
                        return CheckResult(False, msg)
                    else:
                        return CheckResult(False, result)

            return self.check_includes("0.0", attr, value, self.value)

        return CheckResult(True)


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
            if hasattr(qau, self.args["unit_type"][i]):
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

