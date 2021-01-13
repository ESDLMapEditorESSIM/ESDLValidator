from esdltools.validation.repository import SchemaRepository


class ValidationService:
    """Service for handling all logic related to the validation module"""

    def __init__(self, dbLocation):
        self.repo = SchemaRepository(dbLocation)

    def validate(self, file):
        # if file and self.allowed_file(file.filename):
        #    data = file.read()
        #    return Response(data, mimetype='text/xml')

        schemas = self.repo.get_all()
        return [{"id": schema.doc_id, "name": schema["name"], "description": schema["description"]} for schema in schemas]

    def allowed_file(self, filename):
        return '.' in filename and \
            filename.rsplit('.', 1)[1].lower() in ['esdl']
