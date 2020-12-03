from esdltools.validation.functions import utils
from esdltools.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.SELECT, "sum")
class SelectAvg(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "sum",
            "Sum all numbers for a dataset",
            [
                ArgDefinition("property", "The name of the propery containing the value to calculate the average for", True),
                ArgDefinition("dataset", "Which dataset to use, this should be matching an alias given to a previous select query", True)
            ]
        )

    def _execute(self):
        prop, _ = utils.get_args_property(self.args, "property")
        dataset, _ = utils.get_args_property(self.args, "dataset")
        count = 0

        for entry in self.data[dataset]:
            value = getattr(entry, prop)
            count += value

        return count
