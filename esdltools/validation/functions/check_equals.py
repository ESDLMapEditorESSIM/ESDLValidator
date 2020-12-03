from esdltools.validation.functions import utils
from esdltools.validation.functions.function import FunctionFactory, FunctionSelect, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.CHECK, "avg")
class SelectAvg(FunctionSelect):

    def get_arg_definitions(self):
        return [
            ArgDefinition("property", "The name of the propery containing the value to calculate the average for", True),
            ArgDefinition("dataset", "Which dataset to use, this should be matching an alias given to a previous select query", True)
        ]

    def _execute(self, data, args):
        prop, _ = utils.get_args_property(args, "property")
        select, _ = utils.get_args_property(args, "dataset")

        total = 0
        count = 0

        for entry in data[select]:
            value = getattr(entry, prop)
            total += value
            count += 1

        return total / count
