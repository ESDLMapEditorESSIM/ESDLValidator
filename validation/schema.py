class Schema:
    """Schema for ruleset"""
    def __init__(self, json):
        self.loadSchema(json)

    def loadSchema(self, json):
        self.schemaDefinition = json

    def validate(self):
        return "validated"
