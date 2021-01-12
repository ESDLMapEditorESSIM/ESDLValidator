import json
import urllib

import esdltools.api.controller.models as models

from flask import request, make_response
from flask_restx import Api, Resource, fields

from esdltools.api.controller.setup import api, ns_schema
from esdltools.api.service.schema import SchemaService

from esdltools.settings.config import AppConfig

from esdltools.core.exceptions import NameAlreadyExists

schemaService = SchemaService(AppConfig.db_location)

@ns_schema.route('/')
class SchemaListController(Resource):
    """Get a list of validation schemas and add new schemas"""

    @api.doc(description='Get a summary of validation schemas in the database', responses={200: "Ok"})
    @ns_schema.doc(description='Get a list of validation schemas')
    @api.marshal_with(models.schema_summary)
    def get(self):
        """Return a summary of all schemas in the database"""
        
        return schemaService.get_all(), 200

    @ns_schema.doc(description='Post a new validation schema', responses={201: "Created", 409: "Name already exists", 400: "Invalid JSON"})
    @api.expect(models.schema, validate=True)
    def post(self):
        """Post a new validation schema"""

        schemaID = schemaService.insert(request.json)
        return {}, 201, {"location": "/schema/{0}".format(schemaID)}

@ns_schema.route('/<int:schemaID>/')
class SchemaController(Resource):
    """READ/UPDATE/DELETE validation schemas"""

    @api.doc(description='Get a schema by ID', responses={200: "Ok", 404: "Not found"})
    @api.marshal_with(models.schema_summary)
    def get(self, schemaID):
        return schemaService.get_by_id(schemaID), 200
