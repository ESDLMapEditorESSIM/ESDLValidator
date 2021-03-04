from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "has_parent")
class CheckHasParent(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "has_parent",
            "Check if an asset has a parent of type",
            [
                ArgDefinition("type", "The type of parent to check for", True),
            ]
        )

    def execute(self):
        type = utils.get_attribute(self.args, "type")
        esdlClass = esdlUtils.get_esdl_class_from_string(type)

        parent = self.value.eContainer()
        if isinstance(parent, esdlClass):
            return CheckResult(True, "")

        return CheckResult(False, "Parent is not of type {0}".format(type))
