class EsdlValidator:
    """Describes the costs to acquire, install and maintain a certain asset."""
    def __init__(self, schema):
        self.schema = schema
    
    def validate(self, data):
        return "Validating: " + self.schema.validate()