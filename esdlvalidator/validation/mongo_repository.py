import json
import logging

from bson import ObjectId
from bson.errors import InvalidId
from pymongo import MongoClient

from esdlvalidator.core.exceptions import NameAlreadyExists, InvalidJSON, SchemaNotFound
from esdlvalidator.validation.abstract_repository import SchemaRepository

SCHEMA_DB = "ESDLValidationSchemas"
SCHEMA_COLLECTION = "schemaCollection"
log = logging.getLogger(__name__)


class MongoSchemaRepository(SchemaRepository):
    """Repository for retrieving, adding, deleting validation schemas"""

    def __init__(self, host: str = "localhost", port: str = "27017"):
        log.info("Connecting to MongoDB at {}:{}".format(host, port))
        self.mongo_client = MongoClient('mongodb://{}:{}/'.format(host, port))
        self.collection = self.mongo_client.get_database(SCHEMA_DB).get_collection(SCHEMA_COLLECTION)

    def get_all(self):
        documents = []
        for doc in self.collection.find():
            doc['id'] = str(doc['_id'])
            del doc['_id']
            documents.append(doc)
        return documents

    def get_by_id(self, id: str):
        try:
            object_id = ObjectId(id)
        except (InvalidId, ValueError, TypeError):
            raise SchemaNotFound(msg="Requested schema with id {0} not found".format(id))

        document = self.collection.find_one({'_id': object_id})
        if document is None:
            raise SchemaNotFound(msg="Requested schema with id {0} not found".format(id))
        del document['_id']
        document['id'] = id
        return document

    def get_by_ids(self, ids: list):
        documents = []
        for id in ids:
            documents.append(self.get_by_id(id))
        return documents

    def get_by_name(self, name: str):
        document = self.collection.find_one({'name': name})
        if document is None:
            raise SchemaNotFound(msg="Requested schema with name {} not found".format(name))
        document['id'] = str(document['_id'])
        del document['_id']
        return document

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

        log.debug("Inserting {}".format(jsonString))

        try:
            document = json.loads(jsonString)
        except:
            raise InvalidJSON
        
        doc = self.collection.find_one({'name': document["name"]})
        if doc is not None:
            raise NameAlreadyExists
        
        return self.collection.insert_one(document).inserted_id

    def remove_by_id(self, id: str):
        document = self.get_by_id(id)
        log.debug("Deleting {}".format(document))
        self.collection.delete_one({'_id': ObjectId(id)})
        return document

    def update(self, id: str, jsonString: str):
        document = self.get_by_id(id)
        log.debug("Updating {} with {}".format(document, jsonString))
        self.collection.replace_one({'_id': ObjectId(id)}, json.loads(jsonString))
