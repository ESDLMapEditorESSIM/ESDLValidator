from esdltools.validation.repository import SchemaRepository
from esdltools.core.exceptions import UnknownESDLFileType


class ValidationService:
    """Service for handling all logic related to the validation module"""

    def __init__(self, dbLocation):
        self.repo = SchemaRepository(dbLocation)

    def validate(self, file):
        if not self.allowed_file(file.filename):
            raise UnknownESDLFileType

        #    data = file.read()

        schemas = self.repo.get_all()
        return [{"id": schema.doc_id, "name": schema["name"], "description": schema["description"]} for schema in schemas]

    def allowed_file(self, filename):
        return '.' in filename and \
            filename.rsplit('.', 1)[1].lower() in ["esdl", "xml"]
