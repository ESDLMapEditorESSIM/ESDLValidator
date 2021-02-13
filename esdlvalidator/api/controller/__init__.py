from esdlvalidator.api import app
from esdlvalidator.validation.file_repository import FileSchemaRepository
from esdlvalidator.api.service.schema import SchemaService
from esdlvalidator.api.service.validation import ValidationService
from esdlvalidator.validation.mongo_repository import MongoSchemaRepository

# repository = FileSchemaRepository(app.settings.dbLocation)
repository = MongoSchemaRepository()
validationService = ValidationService(repository)
schemaService = SchemaService(repository)
