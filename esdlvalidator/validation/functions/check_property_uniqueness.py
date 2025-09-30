from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "property_uniqueness")
class PropertyUniqueness(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "property_uniqueness",
            "Check if the specified property value is unique among dataset",
            [
                ArgDefinition("property", "A property that need to be checked. This should be matching a property specified in the previous select query", True),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def execute(self):

        property = self.args["property"]
        if not isinstance(property, str):
            raise TypeError(f"Invalid function argument. Argument 'property' should be a string, got {type(property)}")

        properties = self.datasets.get("extracted_properties", {}).get(property)
        if properties is None:
            raise ValueError(f"Error retrieving property '{property}' from datasets.")
        
        p = utils.get_attribute(self.value, property)
        if p is not None:
            counts = properties.count(p)
            if counts > 1:
                msg = f"{self.value.id} has a non-unique '{property}' ({p}), it occurs {counts} times in this ESDL"
                if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                    result = { "offending_asset": self.value.id, "message": msg }
                    return CheckResult(False, result)
                else:
                    return CheckResult(False, msg)

        return CheckResult(True)
