import json
import urllib

from flask import request
from flask_restx import Api, Resource, fields

from esdltools.api.controller.setup import api, ns_schema
from esdltools.api.service.schema import SchemaService


schemaService = SchemaService("testdata/validation.db")
schema_summary = api.model('SchemaSummary', {
    'id': fields.Integer(required=False, description='ID of the schema'),
    'name': fields.String(required=False, description='Name of the schema'),
    'description': fields.String(required=False, description='Description of the schema')
})

post_body = api.model('PostBody', {
    'schema': fields.String(required=True, description='the validation schema')
})


@ns_schema.route('/')
class SchemaListController(Resource):
    """Get a list of validation schemas and add new schemas"""

    @api.doc(description='Get a summary of validation schemas in the database', responses={200: 'Ok'})
    @ns_schema.doc(description='Get a list of validation schemas')
    @api.marshal_with(schema_summary)
    def get(self):
        """Return a summary of all schemas in the database"""

        return schemaService.get_all_schemas(), 200


@ns_schema.route('/<string:schemaID>/')
class SchemaController(Resource):
    """READ/UPDATE/DELETE validation schemas"""

    @api.doc(description='Get a schema by ID', responses={200: "Ok", 404: "Not found .."})
    @api.marshal_with(schema_summary)
    def get(self, schemaID):
        return schemaService.get_schemas_by_id(schemaID), 200

    @api.expect(post_body)
    @ns_schema.doc(description='Post a new validation schema')
    def post(self):
        post_body = json.loads(request.get_data().decode("utf-8"))
        esdl_string = urllib.parse.unquote(post_body["schema"])
        return esdl_string
