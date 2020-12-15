class SchemaResult:
    """Result of a schema validation, this is returned to the user as JSON"""

    def __init__(self, schema, validations):
        self.name = schema["name"]
        self.description = schema["description"]
        self.validation = validations