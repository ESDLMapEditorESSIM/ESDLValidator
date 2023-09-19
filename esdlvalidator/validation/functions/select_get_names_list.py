from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType
# from esdlvalidator.validation.functions.select_get import SelectGet


@FunctionFactory.register(FunctionType.SELECT, "get_nameslist")
class SelectGetNamesList(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "get_nameslist",
            "Get a list of entities from loaded ESDL data and list of all names",
            [
                ArgDefinition("type", "type name of entities to retrieve, this can be a superclass. i.e. Port returns InPort, OutPort...", True),
                ArgDefinition("property","name of property that needs to be saved in list", True)

            ]
        )

    def execute(self):
        dataset = self.datasets.get("resource")
        if isinstance(self.args['type'], str):
            getType = utils.get_attribute(self.args, "type")
            entities = esdlUtils.get_entities_from_esdl_resource_by_type(dataset, getType)
        elif isinstance(self.args['type'], list):
            entities = []
            for arg in self.args['type']:
                getType = utils.get_attribute({'type': arg}, "type")
                if len(entities)==0:
                    entities = esdlUtils.get_entities_from_esdl_resource_by_type(dataset, getType)
                else:
                    entities += esdlUtils.get_entities_from_esdl_resource_by_type(dataset, getType)

        names_list = {}
        if isinstance(self.args["property"], list):
            for property in self.args["property"]:
                names_list[property] = []
                for entity in entities:
                    names_list[property].append(utils.get_attribute(entity, property))

        self.datasets['names_dict'] = names_list

        return entities
