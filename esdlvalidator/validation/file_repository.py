import json
import logging

from esdlvalidator.core.exceptions import NameAlreadyExists, InvalidJSON, SchemaNotFound

from tinydb import TinyDB, Query
from os import path

from esdlvalidator.validation.abstract_repository import SchemaRepository

logger = logging.getLogger(__name__)


class FileSchemaRepository(SchemaRepository):
    """Repository for retrieving, adding, deleting validation schemas"""

    def __init__(self, location: str):
        """Create a repository and initialize the 'database' from the given file"""

        if not path.exists(location):
            try:
                f = open(location, "x")
                logger.info("Created database file {0}".format(location))
            except:
                msg = "Unable to create database file: {0}".format(location)
                logger.critical(msg)
                raise OSError(msg)

        self.db = TinyDB(location)
        self.table = self.db.table("schema")

    def get_all(self):
        """Retrieve all schema's"""

        documents = self.table.all()
        for doc in documents:
            doc["id"] = doc.doc_id
        return documents

    def get_by_id(self, id: int):
        """Retrieve a schema by ID

        Args:
            id (int): ID of the schema

        Returns:
            schema (Document): Validation schema

        Raises:
            SchemaNotFound: Validation schema was not found
        """

        if not self.table.contains(doc_id=id):
            raise SchemaNotFound(msg="Requested schema with id {0} not found".format(id))

        return self.table.get(doc_id=id)

    def get_by_ids(self, ids: list):
        """Retrieve multiple schemas by a list of id's

        Args:
            ids (list): List with schema id's

        Returns:
            schemas: One or more validation schema

        Raises:
            SchemaNotFound: One of the validation schemas was not found
        """

        schemas = []
        for id in ids:
            if not self.table.contains(doc_id=id):
                raise SchemaNotFound(msg="Requested schema with id {0} not found".format(id))

            schema = self.table.get(doc_id=id)
            schema['id'] = id
            schemas.append(schema)

        return schemas

    def get_by_name(self, name: str):
        """Retrieve a schema by name

        Args:
            name (string): Name of the schema

        Returns:
            schema: Validation schema

        Raises:
            SchemaNotFound: Validation schema was not found
        """

        Schema = Query()
        schemas = self.table.search(Schema.name == name)

        if len(schemas) == 0:
            raise SchemaNotFound(msg="Requested schema with name {0} not found".format(name))

        # return schema 0 since name should be unique and there should be no other schemas
        return schemas[0]

    def insert(self, jsonString: str):
        """Insert a new schema

        Args:
            json (string): The schema JSON string

        Returns:
            schemaID: The created id for the schema, can be used to retrieve the schema

        Raises:
            InvalidJSON: If json is not a valid json string or schema name already exist
            NameAlreadyExists: If database already contains a document with the same name
        """

        try:
            document = json.loads(jsonString)
        except:
            raise InvalidJSON

        Schema = Query()
        schemas = self.table.search(Schema.name == document["name"])
        if len(schemas) != 0:
            raise NameAlreadyExists

        schemaID = self.table.insert(document)
        return schemaID

    def remove_by_id(self, id: int):
        """Remove schema by ID

        Args:
            id (int): Schema id

        Returns:
            schemaID: schema id when found

        Raises:
            SchemaNotFound: Validation schema was not found
        """

        if not self.table.contains(doc_id=id):
            raise SchemaNotFound(msg="Unable to remove, no schema found for id: {0}".format(id))

        removed = self.table.remove(doc_ids=[id])
        return removed[0]

    def update(self, id: int, jsonString: str):
        """Update schema by id

        Args:
            id (int): Schema id
            jsonString (string): schema json string

        Returns:
            schemaID: The updated id of the schema

        Raises:
            InvalidJSON: If json is not a valid json string or schema name already exist
            SchemaNotFound: Validation schema was not found
        """

        if not self.table.contains(doc_id=id):
            raise SchemaNotFound

        try:
            document = json.loads(jsonString)
        except:
            raise InvalidJSON

        self.table.update(document, doc_ids=[id])
        return id
