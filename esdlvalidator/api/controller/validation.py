from flask import request
from flask_restx import Resource
from werkzeug.datastructures import FileStorage

from esdlvalidator.api import app
from esdlvalidator.api.controller import validationService

parser = app.api.parser()
parser.add_argument("file", type=FileStorage, location="files", required=True)
parser.add_argument("schemas", type=list, help="List of schema id's, comma separated", location="form", required=True)


@app.ns_validation.route('/')
class ValidationController(Resource):
    """Validate an ESDL file"""

    @app.ns_validation.doc(description="Post a new validation schema", responses={200: "Ok", 404: "Schema not found", 400: "Unknown filetype, Invalid ESDL"})
    @app.api.expect(parser, validate=True)
    def post(self):
        """Validate an ESDL file against one or more validation schemas"""

        file = request.files["file"]
        schemas = [int(id) for id in request.form["schemas"].split(',')]
        result = validationService.validate(file, schemas)

        return result, 200
