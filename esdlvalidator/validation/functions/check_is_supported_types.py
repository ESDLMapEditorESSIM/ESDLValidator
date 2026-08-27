from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import (
    FunctionFactory,
    FunctionCheck,
    FunctionDefinition,
    ArgDefinition,
    FunctionType,
    CheckResult,
)


@FunctionFactory.register(FunctionType.CHECK, "is_supported_types")
class IsSupportedTypes(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "is_supported_types",
            "Check if an entity type is included in the supported types",
            [
                ArgDefinition("types", "The list of supported types.", True),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False),
            ],
        )

    def execute(self):
        types = utils.get_attribute(self.args, "types")
        esdlClasses = esdlUtils.get_esdl_class_from_string(types)
        supported_type = False
        for esdlClass in esdlClasses:
            if isinstance(self.value, esdlClass):
                supported_type = True

        result = ""

        if not supported_type:
            entity_type = type(self.value).__name__
            result = f"{self.value.name} is of type [{entity_type}], which is not included in the supported types [{', '.join(types)}]."

        if self.args.get("resultMsgJSON"):
            msg = {"offending_asset": self.value.id, "message": result}
            return CheckResult(supported_type, msg)

        return CheckResult(supported_type, result)
