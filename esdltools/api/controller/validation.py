from flask import request, Response
from flask_restx import Resource, reqparse
from werkzeug.datastructures import FileStorage

from esdltools.api.controller.setup import api, ns_validation

parser = api.parser()
parser.add_argument("file", type=FileStorage, location="files", required=True)
parser.add_argument("schemas", type=list, help="List of schema id's", location="form", required=True)


@ ns_validation.route('/')
class ValidationController(Resource):
    """Validate an ESDL file"""

    @ ns_validation.doc(description="Post a new validation schema", responses={201: "Created", 409: "Name already exists", 400: "Invalid JSON"})
    @ api.expect(parser, validate=True)
    def post(self):
        """Validate an ESDL file against one or more validation schemas"""

        formdata = request.form["schemas"]
        file = request.files["file"]

        return {'url': file.filename}, 201
