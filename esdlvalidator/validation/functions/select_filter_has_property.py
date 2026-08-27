from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.SELECT, "filter_has_property")
class SelectGet(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "filter_has_property",
            "Filter out entries not containing a certain property",
            [
                ArgDefinition("dataset", "The dataset to filter on", True),
                ArgDefinition("property", "Property to check if exists on all entries, can contain childs: costinformation.marginalcosts", True),
            ]
        )

    def execute(self):
        self.set_values()

        dataset = self.datasets.get(self.dataset)
        entities = []

        for entry in dataset:
            value = utils.get_attribute(entry, self.property, None)
            if value is not None:
                entities.append(entry)

        return entities

    def set_values(self):
        self.dataset = utils.get_attribute(self.args, "dataset")
        self.property = utils.get_attribute(self.args, "property")
