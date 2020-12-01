from esdltools.core.esdl import esdl
from esdltools.core.esdl import utils

from esdltools.validation.functions.function import FunctionFactory, SelectBase


@FunctionFactory.register_select("get")
class SelectGet(SelectBase):

    def _execute(self, data, args):
        getType = args["type"]
        entities = []

        # loop all objects in loaded ESDL
        for uuid in data.uuid_dict:
            esdlObject = data.uuid_dict[uuid]
            if isinstance(esdlObject, utils.get_esdl_class_from_string(getType)):
                entities.append(esdlObject)

        return entities
