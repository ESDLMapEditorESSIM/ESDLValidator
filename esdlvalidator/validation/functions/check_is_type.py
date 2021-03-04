from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "is_type")
class IsType(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "is_type",
            "Check if an object is a given type",
            [
                ArgDefinition("type", "The type the object should be", True),
            ]
        )

    def execute(self):
        type = utils.get_attribute(self.args, "type")
        esdlClass = esdlUtils.get_esdl_class_from_string(type)
        same = isinstance(self.value, esdlClass)
        result = ""

        if not same:
            id = "" if not utils.has_attribute(self.value, "id") else "{0} ".format(self.value.id)
            result = "Object {0}is not of type {1}".format(id, type)

        return CheckResult(same, result)
