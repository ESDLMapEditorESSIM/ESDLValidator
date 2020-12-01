from esdltools.validation.functions.function import FunctionFactory, SelectBase


@FunctionFactory.register_select("sum")
class SelectAvg(SelectBase):

    def _execute(self, data, args):
        prop = args["property"]
        count = 0

        for entry in data:
            value = getattr(entry, prop)
            count += value

        return count
