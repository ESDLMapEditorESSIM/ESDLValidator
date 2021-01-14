import json

from werkzeug.datastructures import FileStorage
from esdltools.validation.repository import SchemaRepository
from esdltools.validation.validator import EsdlValidator
from esdltools.core.exceptions import UnknownESDLFileType
from esdltools.core.esdl import utils


class ValidationService:
    """Service for handling all requests to the validation endpoint"""

    def __init__(self, dbLocation):
        self.repo = SchemaRepository(dbLocation)
        self.validator = EsdlValidator()

    def validate(self, file: FileStorage, schemaIds: list):
        """Validate an uploaded file against the given schemas"""

        if not self.__allowed_file(file.filename):
            raise UnknownESDLFileType

        schemas = self.repo.get_by_ids(schemaIds)
        esdl = self.__load_esdl(file)
        result = self.validator.validate(esdl, schemas)

        # ToDo: This is a bit weird, restx cannot convert result into json, doing it ourself will
        # result in a returned string of the JSON. convert to JSON and loading it works for now
        jsonString = result.toJSON()
        return json.loads(jsonString)

    def __allowed_file(self, filename):
        """Allowed esdl file extensions"""

        return '.' in filename and \
            filename.rsplit('.', 1)[1].lower() in ["esdl", "xml"]

    def __load_esdl(self, file):
        """Get the string of the uploaded file, load it as energy system handler and return the resource"""

        fileBytes = file.read()
        esdlString = fileBytes.decode("utf-8")
        esh = utils.get_esh_from_string(esdlString)
        return esh.resource
