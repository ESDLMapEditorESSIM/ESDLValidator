from esdltools.validation.functions import utils
from esdltools.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.SELECT, "avg")
class SelectAvg(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "avg",
            "Get an average number from previous selected data",
            [
                ArgDefinition("property", "The name of the propery containing the value to calculate the average for", True),
                ArgDefinition("dataset", "Which dataset to use, this should be matching an alias given to a previous select query", True),
                ArgDefinition("ignore", "Ignore values in calculating the average, for example when 0.0 and -1 should not be counted add 'ignore': [0.0, -1]", False)
            ]
        )

    def execute(self):
        prop, _ = utils.get_args_property(self.args, "property")
        dataset, _ = utils.get_args_property(self.args, "dataset")
        
        total = 0
        count = 0

        for entry in self.datasets.get(dataset):
            value = getattr(entry, prop)
            total += value
            count += 1

        return total / count
