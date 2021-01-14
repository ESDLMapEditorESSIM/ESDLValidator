import json

from esdltools.validation.repository import SchemaRepository


class SchemaService:
    """Service for handling all requests to schema endpoint"""

    def __init__(self, schemaRepository: SchemaRepository):
        self.repo = schemaRepository

    def get_all(self):
        """Get an overview of all schemas from the database

        Returns:
            schemas (list): summary of schemas in the database, not the complete schemas
        """

        schemas = self.repo.get_all()
        return [{"id": schema.doc_id, "name": schema["name"], "description": schema["description"]} for schema in schemas]

    def get_by_id(self, id: int):
        """Get a schema by schema id

        Args:
            id (int): Schema id

        Returns:
            schema (Document): Schema for given id

        Raises:
            SchemaNotFound: Validation schemas was not found
        """

        return self.repo.get_by_id(id)

    def get_by_name(self, name: str):
        """Get a schema by name

        Args:
            name (str): Schema name

        Returns:
            schema (Document): Schema for given name

        Raises:
            SchemaNotFound: Validation schemas was not found
        """

        return self.repo.get_by_name(name)

    def insert(self, schema: str):
        """Insert a schema into the database

        Args:
            schema (str): schema as JSON string

        Returns:
            id (int): ID assigned to the document by the database

        Raises:
            InvalidJSON: If json is not a valid json string or schema name already exist
            NameAlreadyExists: If database already contains a document with the same name
        """

        return self.repo.insert(json.dumps(schema))

    def delete(self, id: int):
        """Remove schema by ID

        Args:
            id (int): Schema id

        Returns:
            schemaID: schema id when found

        Raises:
            SchemaNotFound: Validation schema was not found
        """

        return self.repo.remove_by_id(id)

    def update(self, id: int, schema: str):
        """Update schema by id

        Args:
            id (int): Schema id
            shema: schema

        Returns:
            schemaID: The updated id of the schema

        Raises:
            InvalidJSON: If json is not a valid json string or schema name already exists
            SchemaNotFound: Validation schema was not found
        """

        return self.repo.update(id, json.dumps(schema))
