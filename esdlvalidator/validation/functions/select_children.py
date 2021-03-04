from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.SELECT, "select_children")
class SelectAvg(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "select_children",
            "Select children for a given type from a dataset",
            [
                ArgDefinition("dataset", "The alias of the dataset to get the children from", True),
                ArgDefinition("type", "The type of children to get", True),
            ]
        )

    def execute(self):
        type = utils.get_attribute(self.args, "type")
        dataset = utils.get_attribute(self.args, "dataset")
        esdlClass = esdlUtils.get_esdl_class_from_string(type)
        entities = []

        for entry in self.datasets.get(dataset):
            children = entry.eContents
            for c in children:
                if isinstance(c, esdlClass):
                    entities.append(c)

        return entities
