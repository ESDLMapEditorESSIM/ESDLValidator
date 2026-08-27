import json

from werkzeug.datastructures import FileStorage

from esdlvalidator.core.esdl import utils
from esdlvalidator.core.exceptions import UnknownESDLFileType
from esdlvalidator.validation.abstract_repository import SchemaRepository
from esdlvalidator.validation.validator import EsdlValidator


class ValidationService:
    """Service for handling all requests to the validation endpoint"""

    def __init__(self, schemaRepository: SchemaRepository):
        self.__repo = schemaRepository
        self.__validator = EsdlValidator()
        self.esdl = None

    def validate(self, file: FileStorage, schemaIds: list):
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
        self.esdl = self.__load_esdl(file)
        result = self.__validator.validate(self.esdl, schemas)

        # ToDo: fix need for toJSON and then back
        jsonString = result.toJSON()
        return json.loads(jsonString)

    def validateContents(self, esdlContents: str, schemaIds: list):
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
        self.esdl = self.__load_esdl_by_string(esdlContents)
        result = self.__validator.validate(self.esdl, schemas)

        # ToDo: fix need for toJSON and then back
        jsonString = result.toJSON()
        return json.loads(jsonString)

    def __allowed_file(self, filename):
        """Allowed esdl file extensions"""

        return "." in filename and \
               filename.rsplit(".", 1)[1].lower() in ["esdl", "xml"]

    def __load_esdl(self, file):
        """Get the string of the uploaded file, load it as energy system handler and return the resource"""

        fileBytes = file.read()
        esdlString = fileBytes.decode("utf-8")
        esh = utils.get_esh_from_string(esdlString)
        return esh.resource

    def __load_esdl_by_string(self, esdl_string: str):
        """Get the string of the uploaded file, load it as energy system handler and return the resource"""

        esh = utils.get_esh_from_string(esdl_string)
        return esh.resource
