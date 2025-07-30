from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.SELECT, "get")
class SelectGet(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "get",
            "Get a list of entities of the specified type(s) from the input ESDL. " \
            "Optionally, specifying `exlcude_type` to filter out certain type(s). " \
            "If a `property` argument is specified, the corresponding property values will be extracted from the queried entities and returned in the datasets.",
            [
                ArgDefinition("type", "A (list of) type name of entities to retrieve, this can be a superclass. i.e. Port returns InPort, OutPort...", True),
                ArgDefinition("exclude_type", "A (list of) type name of entities to exclude, this can be a superclass. i.e. Port returns InPort, OutPort...", False),
                ArgDefinition("property", "A (list of) property of entities to be extracted and be stored additionally in the returned datasets", False)
            ]
        )

    def execute(self):
        dataset = self.datasets.get("resource")

        types = self.args["type"]
        if isinstance(types, str):
            types = [types]

        excluded_esdlClasses = []
        if "exclude_type" in self.args:
            if isinstance(self.args["exclude_type"], (str, list)):
                excluded_esdlClasses = esdlUtils.get_esdl_class_from_string(self.args["exclude_type"])
            else:
                raise ValueError(f"Invalid function argument 'exclude_type' type. Expect str or list, got {type(self.args['exclude_type'])}")
        
        properties = []
        if "property" in self.args:
            if isinstance(self.args["property"], str):
                properties = [self.args["property"]]
            elif isinstance(self.args["property"], list):
                properties = self.args["property"]
            else:
                raise ValueError(f"Invalid function argument 'property' type. Expect str or list, got {type(self.args['property'])}")

        selected_entities = []
        for type in types:
            getType = utils.get_attribute({'type': type}, "type")
            entities = esdlUtils.get_entities_from_esdl_resource_by_type(dataset, getType)

            for entity in entities:
                if not any(isinstance(entity, e_cls) for e_cls in excluded_esdlClasses):
                    selected_entities.append(entity)

        if len(properties):
            self.datasets["extracted_properties"] = {}
            for p in properties:
                self.datasets["extracted_properties"][p] = []
                for entity in selected_entities:
                    e_property = utils.get_attribute(entity, p)
                    self.datasets["extracted_properties"][p].append(e_property)
           
        return selected_entities