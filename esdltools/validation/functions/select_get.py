from esdltools.core.esdl import esdl
from esdltools.core.esdl import utils as esdlUtils

from esdltools.validation.functions import utils
from esdltools.validation.functions.function import FunctionFactory, SelectBase, ArgDefinition


@FunctionFactory.register_select("get")
class SelectGet(SelectBase):

    def get_arg_definitions(self):
        return [
            ArgDefinition("type", "type name of entities to retrieve, this can be a superclass. i.e. Port returns InPort, OutPort...", True)
        ]

    def _execute(self, data, args):
        getType, _ = utils.get_args_property(args, "type")
        entities = esdlUtils.get_entities_from_esdl_resource_by_type(data, getType)

        return entities
