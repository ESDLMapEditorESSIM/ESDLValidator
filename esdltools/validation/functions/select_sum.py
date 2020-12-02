from esdltools.validation.functions import utils
from esdltools.validation.functions.function import FunctionFactory, SelectBase, ArgDefinition


@FunctionFactory.register_select("sum")
class SelectAvg(SelectBase):

    def get_arg_definitions(self):
        argDefinitions = [
            ArgDefinition("property", "The name of the propery containing the value to calculate the average for", True),
            ArgDefinition("dataset", "Which dataset to use, this should be matching an alias given to a previous select query", True)
        ]

        return argDefinitions

    def _execute(self, data, args):
        prop = args["property"]
        dataset = args["select"]
        count = 0

        for entry in data[dataset]:
            value = getattr(entry, prop)
            count += value

        return count
