from esdltools.core.esdl import esdl
from esdltools.core.esdl import utils

from esdltools.validation.functions.function import FunctionFactory, SelectBase


@FunctionFactory.register_select("get")
class SelectGet(SelectBase):

    def _execute(self, data, args):
        getType = args["type"]
        entities = utils.get_entities_from_esdl_resource_by_type(data, getType)

        return entities
