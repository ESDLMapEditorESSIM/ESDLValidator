from esdltools.api import config
from esdltools.validation.repository import SchemaRepository
from esdltools.api.service.schema import SchemaService
from esdltools.api.service.validation import ValidationService

repository = SchemaRepository(config.db_location)
validationService = ValidationService(repository)
schemaService = SchemaService(repository)
