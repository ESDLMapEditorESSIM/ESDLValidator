import json

from werkzeug.datastructures import FileStorage

from esdlvalidator.core.esdl import utils
from esdlvalidator.core.exceptions import UnknownESDLFileType
from esdlvalidator.validation.abstract_repository import SchemaRepository
from esdlvalidator.validation.validator import Validator


class ValidationService:
    """Service for handling all requests to the validation endpoint"""

    def __init__(self, schemaRepository: SchemaRepository):
        self.__repo = schemaRepository
        self.__validator = Validator()
        self.esdl = None

    def validate(self, file: FileStorage, schemaIds: list, validateXsd: bool):
        """Validate an uploaded file against the given schemas
        Args:
            file (FileStorage): Uploaded file
            schemaIds: List of schema id's to validate against. example [1,2]
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
        esdlString = self.__get_esdl_string(file)
        result = self.__validator.validate(esdlString, schemas, validateXsd)

        # ToDo: fix need for toJSON and then back
        jsonString = result.toJSON()
        return json.loads(jsonString)

    def validateContents(self, esdlContents: str, schemaIds: list, validateXsd: bool):
        """Validate an uploaded file contents against the given schemas
        Args:
            esdlContents (String): Uploaded file contents
            schemaIds: List of schema id's to validate against. example [1,2]
        Returns:
            result: JSON result of the validation
        Raises:
            SchemaNotFound: One of the validation schemas was not found
            UnknownESDLFileType: Type of uploaded file is not supported
        """

        schemas = self.__repo.get_by_ids(schemaIds)
        result = self.__validator.validate(esdlContents, schemas, validateXsd)

        # ToDo: fix need for toJSON and then back
        jsonString = result.toJSON()
        return json.loads(jsonString)

    def __allowed_file(self, filename):
        """Allowed esdl file extensions"""

        return "." in filename and \
               filename.rsplit(".", 1)[1].lower() in ["esdl", "xml"]

    def __get_esdl_string(self, file):
        """Get a string from the uploaded file"""

        fileBytes = file.read()
        esdlString = fileBytes.decode("utf-8")
        return esdlString
