from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.SELECT, "get_exclude")
class SelectGetExclude(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "get_exclude",
            "Get a list of entities from loaded ESDL data",
            [
                ArgDefinition("type", "type name of entities to retrieve, this can be a superclass. i.e. Port returns InPort, OutPort...", True),
                ArgDefinition("exclude_types", "type name of entities to exclude, this can be a superclass. i.e. Port returns InPort, OutPort...", True)
            ]
        )

    def execute(self):
        dataset = self.datasets.get("resource")
        esdlClasses = esdlUtils.get_esdl_class_from_string(self.args["exclude_types"])
        entities = []
        if isinstance(self.args['type'], str):
            getType = utils.get_attribute(self.args, "type")
            conditions = esdlUtils.get_entities_from_esdl_resource_by_type(dataset, getType)
            for condition in conditions:
                count_class = 0
                for esdlClass in esdlClasses:
                    if isinstance(condition, esdlClass):
                        count_class +=1
                if count_class == 0:
                    entities.append(condition)

        return entities
