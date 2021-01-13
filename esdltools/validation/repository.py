import json
import logging

from esdltools.core.exceptions import NameAlreadyExists, InvalidJSON, SchemaNotFound

from tinydb import TinyDB, Query
from os import path

logger = logging.getLogger(__name__)


class SchemaRepository:
    """Repository for retrieving, adding, deleting validation schemas"""

    def __init__(self, location: str):
        """Create a repository and initialize the 'database' from the given file"""

        if not path.exists(location):
            try:
                f = open(location, "x")
                logger.info("Created database file {0}".format(location))
            except:
                raise OSError("Unable to create database file: {0}".format(location))

        self.db = TinyDB(location)
        self.table = self.db.table("schema")

    def get_all(self):
        """Retrieve all schema's"""

        return self.table.all()

    def get_by_id(self, id: int):
        """Retrieve a schema by ID

        Args:
            id (int): ID of the schema

        Returns:
            schema: Validation schema

        Raises:
            SchemaNotFound: Validation schema was not found
        """

        if not self.table.contains(doc_id=id):
            raise SchemaNotFound
            
        return self.table.get(doc_id=id)

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
            raise SchemaNotFound

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
            raise SchemaNotFound

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
