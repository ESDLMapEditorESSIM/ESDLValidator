import json
import logging
import os

from bson import ObjectId
from bson.errors import InvalidId
from pymongo import MongoClient

from esdlvalidator.core.exceptions import SchemaNotFound
from esdlvalidator.validation.abstract_repository import SchemaRepository

MONGODB_HOST = "MONGODB_HOST"
MONGODB_PORT = "MONGODB_PORT"
SCHEMA_DB = "ESDLValidationSchemas"
SCHEMA_COLLECTION = "schemaCollection"
log = logging.getLogger(__name__)


class MongoSchemaRepository(SchemaRepository):
    """Repository for retrieving, adding, deleting validation schemas"""

    def __init__(self):
        mongo_host = os.getenv(MONGODB_HOST, default="localhost")
        mongo_port = os.getenv(MONGODB_PORT, default="27017")
        self.mongo_client = MongoClient('mongodb://{}:{}/'.format(mongo_host, mongo_port))
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
        log.debug("Inserting {}".format(jsonString))
        document = json.loads(jsonString)
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
