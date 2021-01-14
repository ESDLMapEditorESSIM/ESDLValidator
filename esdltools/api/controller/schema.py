import logging

from flask import request
from flask_restx import Resource

from esdltools.api import app, models
from esdltools.api.controller import schemaService

logger = logging.getLogger(__name__)


@app.ns_schema.route('/')
class SchemaListController(Resource):
    """Get a list of validation schemas and add new schemas"""

    @app.api.doc(description="Get a summary of validation schemas in the database", responses={200: "Ok"})
    @app.ns_schema.doc(description='Get a list of validation schemas')
    @app.api.marshal_with(models.schema_summary)
    def get(self):
        """Return a summary of all schemas in the database"""

        return schemaService.get_all(), 200

    @app.ns_schema.doc(description="Post a new validation schema", responses={201: "Created", 409: "Name already exists", 400: "Invalid JSON"})
    @app.api.expect(models.schema, validate=True)
    def post(self):
        """Post a new validation schema"""

        schemaID = schemaService.insert(request.json)
        return {}, 201, {"location": "/schema/{0}".format(schemaID)}


@app.ns_schema.route('/<int:schemaID>/')
class SchemaController(Resource):
    """GET/UPDATE/DELETE validation schemas"""

    @app.api.doc(description="Get a schema by ID", responses={200: "Ok", 404: "Schema not found"})
    def get(self, schemaID):
        """Get a validation schema by ID"""

        return schemaService.get_by_id(schemaID), 200

    @app.api.doc(description="Delete a schema by ID", responses={200: "Ok, schema was deleted", 404: "Schema not found"})
    def delete(self, schemaID):
        """Delete a validation schema from the database"""

        return schemaService.delete(schemaID), 200

    @app.api.doc(description="Update a validation schema", responses={200: "Ok, schema was updated", 404: "Schema not found", 400: "Invalid JSON"})
    @app.api.expect(models.schema, validate=True)
    def put(self, schemaID):
        """Delete a validation schema from the database"""

        schemaID = schemaService.update(schemaID, request.json)
        return {}, 200, {"location": "/schema/{0}".format(schemaID)}
