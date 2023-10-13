import json

from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "name_condition")
class NameCondition(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "name_condition",
            "Asset names agrees with conditions",
            [
                ArgDefinition("condition", "The condition for which the names need to be checked", True),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        names_list = self.datasets.get("names_dict")["name"]

        msg = {"offending_asset": self.value.id}
        if self.args["condition"] == "uniqueness":
            count = names_list.count(self.value.name)
            if count != 1:
                result = "{} has a non-unique name ({}), it occurs {} times in this ESDL".format(self.value.id,
                                                                                                 self.value.name, count)
                if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                    msg["message"] = result
                    return CheckResult(False, msg)
                else:
                    return CheckResult(False, result)
        elif self.args["condition"] == "supply_return":
            if self.value.name.endswith('_ret'):
                check_name = self.value.name[:-4]
                if check_name not in names_list:
                    result = ("{} does not have a parallel supply asset with the name ({})").format(
                        self.value.id, check_name)
                    if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                        msg["message"] = result
                        return CheckResult(False, msg)
                    else:
                        return CheckResult(False, result)
            else:
                check_name = self.value.name + '_ret'
                if check_name not in names_list:
                    result = ("{} ({}) does not have a parallel return asset with the name ({})").format(
                        self.value.id, self.value.name, check_name)
                    if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                        msg["message"] = result
                        return CheckResult(False, msg)
                    else:
                        return CheckResult(False, result)
        else:
            CheckResult(False, "No proper condition was selected")


        return CheckResult(True)
