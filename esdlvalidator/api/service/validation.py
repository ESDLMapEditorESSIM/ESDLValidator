import json

from werkzeug.datastructures import FileStorage


from esdlvalidator.core.exceptions import UnknownESDLFileType
from esdlvalidator.validation.repository import SchemaRepository
from esdlvalidator.validation.validator import Validator


class ValidationService:
    """Service for handling all requests to the validation endpoint"""

    def __init__(self, schemaRepository: SchemaRepository):
        self.__repo = schemaRepository
        self.__validator = Validator()

    def validate(self, file: FileStorage, schemaIds: list, validateXsd: bool):
        """Validate an uploaded file against the given schemas

        Args:
            file (FileStorage): Uploaded file
            schemaIds: List of schema id's to validate against. example [1,2]
            validateXsd bool: If the validator should also check against xsd

        Returns:
            result: JSON result of the validation

        Raises:
            SchemaNotFound: One of the validation schemas was not found
            UnknownESDLFileType: Type of uploaded file is not supported
            InvalidESDL: ESDL could not be loaded by the system
        """

        if not self.__allowed_file(file.filename):
            raise UnknownESDLFileType

        schemas = self.__repo.get_by_ids(schemaIds)
        result = self.__validator.validate(file, schemas, validateXsd)
        jsonString = result.toJSON()

        return json.loads(jsonString)

    def __allowed_file(self, filename):
        """Allowed esdl file extensions"""

        return "." in filename and \
            filename.rsplit(".", 1)[1].lower() in ["esdl", "xml"]
