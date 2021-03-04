from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "has_child")
class CheckHasChild(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "has_child",
            "Check if an asset has children of type",
            [
                ArgDefinition("type", "The type of children to check for", True),
            ]
        )

    def execute(self):
        type = utils.get_attribute(self.args, "type")
        esdlClass = esdlUtils.get_esdl_class_from_string(type)

        children = self.value.eContents
        for c in children:
            if isinstance(c, esdlClass):
                return CheckResult(True, "")

        return CheckResult(False, "Asset does not contain any child of type {0}".format(type))
