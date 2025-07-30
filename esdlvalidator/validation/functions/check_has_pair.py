from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "has_pair")
class HasPair(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "has_pair",
            "Check whether the entity has a paired entity " \
            "by inspecting if the given keyword of the specified property is (not) presented in the paired entity. " \
            "This can be used to check e.g. Pipe has both supply and return entities presented in ESDL with keyword '_ret'.",
            [
                ArgDefinition("property", "A property that need to be checked (usually 'name'). This should be matching a property specified in the previous select query", True),
                ArgDefinition("keyword", "A keyword string used to identify if the paired entity existed", True),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def execute(self):

        property = self.args["property"]
        if not isinstance(property, str):
            raise ValueError(f"Invalid function argument. Argument 'property' should be a string, got {type(property)}.")
        
        keyword = self.args["keyword"]
        if not isinstance(keyword, str):
            raise ValueError(f"Invalid function argument. Argument 'keyword' should be a string, got {type(keyword)}.")

        properties = self.datasets.get("extracted_properties", {}).get(property)
        if properties is None:
            raise ValueError(f"Error retrieving property '{property}' from datasets.")
        
        p = utils.get_attribute(self.value, property)
        if p is None or not isinstance(p, str):
            raise ValueError(f"Expect '{property}' to a string, got {type(p)}.")
        
        msg = None
        if keyword in p:
            p_paired = p.replace(keyword, "")
            if p_paired not in properties:
                msg = f"{self.value.id} ({self.value.name}) does not have a paired entity with '{property}' = '{p_paired}'"
        else:
            has_paired = any(
                keyword in item and item.replace(keyword, "") == p 
                for item in properties
            )
            if not has_paired:
                msg = f"{self.value.id} ({self.value.name}) does not have a paired entity with '{property}' property containing: '{p}' and '{keyword}'"

        if msg:
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                result = { "offending_asset": self.value.id, "message": msg }
                return CheckResult(False, result)
            else:
                return CheckResult(False, msg)

        return CheckResult(True)
