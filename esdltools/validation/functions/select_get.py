from esdltools.core.esdl import esdl
from esdltools.core.esdl import utils as esdlUtils

from esdltools.validation.functions import utils
from esdltools.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.SELECT, "get")
class SelectGet(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "get",
            "Get a list of entities from loaded ESDL data",
            [
                ArgDefinition("type", "type name of entities to retrieve, this can be a superclass. i.e. Port returns InPort, OutPort...", True)
            ]
        )

    def execute(self):
        dataset = self.datasets.get("resource")
        getType, _ = utils.get_args_property(self.args, "type")
        entities = esdlUtils.get_entities_from_esdl_resource_by_type(dataset, getType)

        return entities
