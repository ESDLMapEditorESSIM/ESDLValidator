from flask import request
from flask_restx import Resource
from flask_restx import inputs
from werkzeug.datastructures import FileStorage

from esdlvalidator.api import app
from esdlvalidator.api.controller import validationService

parser = app.api.parser()
parser.add_argument("file", type=FileStorage, location="files", required=True)
parser.add_argument("schemas", type=list, help="List of schema id's, comma separated", location="form", required=True)
parser.add_argument("validateXsd", type=inputs.boolean, help="Validate file against xsd schema", location="form", required=False)


@app.ns_validation.route('/')
class ValidationController(Resource):
    """Validate an ESDL file"""

    @app.ns_validation.doc(description="Validate ESDL against schema and or xsd", responses={
        200: "Ok",
        404: "Schema not found",
        400: "Unknown filetype, Invalid ESDL"})
    @app.api.expect(parser, validate=True)
    def post(self):
        """Validate an ESDL file against one or more validation schemas"""

        file = request.files["file"]
        schemas = [int(id) for id in request.form["schemas"].split(',')]
        validateXsd = True if "validateXsd" not in request.form else request.form["validateXsd"] in ("True", "true", "1")
        result = validationService.validate(file, schemas, validateXsd)

        return result, 200
