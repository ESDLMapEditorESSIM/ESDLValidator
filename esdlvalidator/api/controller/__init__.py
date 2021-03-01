from esdlvalidator.api import app
from esdlvalidator.validation.file_repository import FileSchemaRepository
from esdlvalidator.api.service.schema import SchemaService
from esdlvalidator.api.service.validation import ValidationService
from esdlvalidator.validation.mongo_repository import MongoSchemaRepository


def get_repository():
    repoType = app.settings.repositoryType.lower()
    if repoType == "file":
        return FileSchemaRepository(app.settings.dbLocation)
    elif repoType == "mongo":
        return MongoSchemaRepository()

    return FileSchemaRepository(app.settings.dbLocation)


repository = get_repository()
validationService = ValidationService(repository)
schemaService = SchemaService(repository)
