from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.SELECT, "all_but")
class SelectGet(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "all_but",
            "Get a list of entities from loaded ESDL data",
            [
                ArgDefinition("type", "type name of entities NOT to retrieve, this can be a superclass. i.e. Port returns InPort, OutPort...", True)
            ]
        )

    def execute(self):
        dataset = self.datasets.get("resource")
        getType = utils.get_attribute(self.args, "type")
        entities = esdlUtils.get_entities_from_esdl_resource_but_for_type(dataset, getType)

        return entities
