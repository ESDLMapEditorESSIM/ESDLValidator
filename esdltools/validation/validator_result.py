import json


class ValidatorResult:
    """Result of a validation, this is returned to the user as JSON"""

    def __init__(self, schemas):
        self.schemas = schemas

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__, sort_keys=False, indent=4)
