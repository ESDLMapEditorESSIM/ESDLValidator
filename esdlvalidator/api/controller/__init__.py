from esdlvalidator.api import app
from esdlvalidator.validation.repository import SchemaRepository
from esdlvalidator.api.service.schema import SchemaService
from esdlvalidator.api.service.validation import ValidationService

repository = SchemaRepository(app.settings.dbLocation)
validationService = ValidationService(repository)
schemaService = SchemaService(repository)
