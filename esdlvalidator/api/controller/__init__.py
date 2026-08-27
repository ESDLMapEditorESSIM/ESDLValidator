from esdlvalidator.api import app
from esdlvalidator.api.service.schema import SchemaService
from esdlvalidator.api.service.validation import ValidationService
from esdlvalidator.validation.mongo_repository import MongoSchemaRepository

repository = MongoSchemaRepository(host=app.settings.mongoHost, port=app.settings.mongoPort)
validationService = ValidationService(repository)
schemaService = SchemaService(repository)
