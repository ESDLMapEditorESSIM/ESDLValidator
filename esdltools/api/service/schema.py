import json

from esdltools.validation.repository import SchemaRepository


class SchemaService:
    """Service for handling all logic related to the validation module"""

    def __init__(self, dbLocation):
        self.repo = SchemaRepository(dbLocation)

    def get_all(self):
        schemas = self.repo.get_all()
        return [{"id": schema.doc_id, "name": schema["name"], "description": schema["description"]} for schema in schemas]

    def get_by_id(self, id: int):
        return self.repo.get_by_id(id)

    def get_by_name(self, name: str):
        return self.repo.get_by_name(name)

    def insert(self, schema):
        return self.repo.insert(json.dumps(schema))
