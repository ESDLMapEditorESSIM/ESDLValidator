from esdlvalidator.api.service.schema import SchemaService
from esdlvalidator.api.service.validation import ValidationService
from esdlvalidator.validation.mongo_repository import MongoSchemaRepository

repository = MongoSchemaRepository()
validationService = ValidationService(repository)
schemaService = SchemaService(repository)
