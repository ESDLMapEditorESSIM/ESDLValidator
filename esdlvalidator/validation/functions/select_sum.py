from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.SELECT, "sum")
class SelectSum(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "sum",
            "Sum all numbers for a dataset",
            [
                ArgDefinition("property", "The name of the propery containing the value to calculate the average for", True),
                ArgDefinition("dataset", "Which dataset to use, this should be matching an alias given to a previous select query", True)
            ]
        )

    def execute(self):
        prop = utils.get_attribute(self.args, "property")
        dataset = utils.get_attribute(self.args, "dataset")
        count = 0

        for entry in self.datasets.get(dataset):
            value = getattr(entry, prop)
            count += value

        return count
