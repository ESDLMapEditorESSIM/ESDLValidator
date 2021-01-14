from esdltools.api import app
from esdltools.validation.repository import SchemaRepository
from esdltools.api.service.schema import SchemaService
from esdltools.api.service.validation import ValidationService

repository = SchemaRepository(app.settings.dbLocation)
validationService = ValidationService(repository)
schemaService = SchemaService(repository)
