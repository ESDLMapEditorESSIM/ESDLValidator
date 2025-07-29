from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.SELECT, "get")
class SelectGet(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "get",
            "Get a list of entities from loaded ESDL data",
            [
                ArgDefinition("type", "A (list of) type name of entities to retrieve, this can be a superclass. i.e. Port returns InPort, OutPort...", True),
                ArgDefinition("exclude_type", "A (list of) type name of entities to exclude, this can be a superclass. i.e. Port returns InPort, OutPort...", False)
            ]
        )

    def execute(self):
        dataset = self.datasets.get("resource")

        types = self.args["type"]
        if isinstance(types, str):
            types = [types]

        excluded_esdlClasses = []
        if 'exclude_type' in self.args:
            if isinstance(self.args['exclude_type'], str) or isinstance(self.args['exclude_type'], list):
                excluded_esdlClasses = esdlUtils.get_esdl_class_from_string(self.args["exclude_type"])
            else:
                raise ValueError("Invalid function argument 'exclude_type' type. Expect str or list[str].")

        selected_entities = []
        for type in types:
            getType = utils.get_attribute({'type': type}, "type")
            entities = esdlUtils.get_entities_from_esdl_resource_by_type(dataset, getType)

            for entity in entities:
                if not any(isinstance(entity, e_cls) for e_cls in excluded_esdlClasses):
                    selected_entities.append(entity)
           
        return selected_entities