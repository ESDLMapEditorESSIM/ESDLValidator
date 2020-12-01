from esdltools.validation.functions.function import FunctionFactory, SelectBase


@FunctionFactory.register_select("avg")
class SelectAvg(SelectBase):

    def _execute(self, data, args):
        prop = args["property"]
        total = 0
        count = 0

        for entry in data:
            value = getattr(entry, prop)
            total += value
            count += 1

        return total / count
