from validation.repository import SchemaRepository

class ValidationService:
    """Service for handling all logic related to the validation module"""

    def __init__(self, dbLocation):
        self.repo = SchemaRepository(dbLocation)

    def get_all_schemas(self):
        schemas = self.repo.get_all()
        return [{"id": schema.doc_id, "name": schema["name"], "description": schema["description"]} for schema in schemas]

    def get_schemas_by_id(self, id):
        return self.repo.get_by_id(id)
