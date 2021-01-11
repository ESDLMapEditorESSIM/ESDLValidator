import json

class ValidatorResult:
    """Result of a validation, this is returned to the user as JSON"""

    def __init__(self, schemas):
        #self.name = schema["name"]
        #self.description = schema["description"]
        self.schemas = schemas

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__, sort_keys=False, indent=4)