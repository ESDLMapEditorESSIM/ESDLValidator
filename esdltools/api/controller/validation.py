from flask import request, Response
from flask_restx import Resource, reqparse
from werkzeug.datastructures import FileStorage

from esdltools.api.controller.setup import api, ns_validation
from esdltools.api.service.validation import ValidationService
from esdltools.settings.config import AppConfig

parser = api.parser()
parser.add_argument("file", type=FileStorage, location="files", required=True)
parser.add_argument("schemas", type=list, help="List of schema id's", location="form", required=True)

validationService = ValidationService(AppConfig.db_location)


@ ns_validation.route('/')
class ValidationController(Resource):
    """Validate an ESDL file"""

    @ ns_validation.doc(description="Post a new validation schema", responses={200: "Ok", 404: "Schema not found", 400: "Unknown filetype, Invalid ESDL"})
    @ api.expect(parser, validate=True)
    def post(self):
        """Validate an ESDL file against one or more validation schemas"""

        file = request.files["file"]
        schemas = [int(x) for x in request.form["schemas"].split(',')]
        result = validationService.validate(file, schemas)

        return result
