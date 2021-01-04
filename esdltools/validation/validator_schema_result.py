import json

class SchemaResult:
    """Result of a schema validation, this is returned to the user as JSON"""

    def __init__(self, schema, validations):
        self.name = schema["name"]
        self.description = schema["description"]
        self.validation = validations

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__, sort_keys=False, indent=4)