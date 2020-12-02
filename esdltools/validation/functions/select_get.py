from esdltools.core.esdl import esdl
from esdltools.core.esdl import utils

from esdltools.validation.functions.function import FunctionFactory, SelectBase, ArgDefinition

@FunctionFactory.register_select("get")
class SelectGet(SelectBase):

    def get_arg_definitions(self):
        argDefinitions = [
            ArgDefinition("type", "type name of entities to retrieve, this can be a superclass. i.e. Port returns InPort, OutPort...", True)
        ]

        return argDefinitions

    def _execute(self, data, args):
        getType = args["type"]
        entities = utils.get_entities_from_esdl_resource_by_type(data, getType)

        return entities
