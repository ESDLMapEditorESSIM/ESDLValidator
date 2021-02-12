import json


class EsdlResult:
    """Result of an ESDL validation, this is returned to the user as JSON"""

    def __init__(self, schemas):
        self.__set_info(schemas)
        self.schemas = schemas

    def __set_info(self, schemas):
        self.valid = True
        self.errorCount = 0
        self.warningCount = 0

        for schema in schemas:
            for validation in schema.validations:
                if hasattr(validation, 'errors'):
                    self.errorCount += len(validation.errors)
                if hasattr(validation, 'warnings'):
                    self.warningCount += len(validation.warnings)

        if self.errorCount > 0:
            self.valid = False

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__, sort_keys=False, indent=4)
