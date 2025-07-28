import logging

from flask import request
from flask_restx import Resource

from esdlvalidator.api import app, models
from esdlvalidator.api.controller import schemaService
from esdlvalidator.core.exceptions import SchemaNotFound

logger = logging.getLogger(__name__)


@app.ns_schema.route('/')
class SchemaListController(Resource):
    """Get a list of validation schemas and add new schemas"""

    @app.api.doc(description="Get a summary of validation schemas in the database", responses={
        200: "Ok"})
    @app.ns_schema.doc(description='Get a list of validation schemas')
    @app.api.marshal_with(models.schema_summary)
    def get(self):
        """Return a summary of all schemas in the database"""

        return schemaService.get_all(), 200

    @app.ns_schema.doc(description="Post a new validation schema", responses={
        201: "Created",
        409: "Name already exists",
        400: "Invalid JSON"})
    @app.api.expect(models.schema, validate=True)
    def post(self):
        """Post a new validation schema"""

        schema_id = schemaService.insert(request.json)
        return {"location": "/schema/{0}".format(schema_id)}, 201


@app.ns_schema.route('/<string:schema_id_or_name>/')
class SchemaController(Resource):
    """GET/UPDATE/DELETE validation schemas"""

    @app.api.doc(description="Get a validation schema by ID or name", responses={
        200: "Ok",
        404: "Schema not found"})
    def get(self, schema_id_or_name: str):
        """Get a validation schema by ID or name"""

        try:
            doc = schemaService.get_by_id(schema_id_or_name)
        except SchemaNotFound:
            try:
                doc = schemaService.get_by_name(schema_id_or_name)
            except SchemaNotFound:
                return "Requested schema with name/id '{}' not found".format(schema_id_or_name), 404

        return doc, 200

    @app.api.doc(description="Delete a validation schema by ID", responses={
        200: "Ok, schema was deleted",
        404: "Schema not found"})
    def delete(self, schema_id_or_name: str):
        """Delete a validation schema by ID"""

        try:
            schemaService.get_by_id(schema_id_or_name)
        except SchemaNotFound:
            return "Requested schema with name/id '{}' not found".format(schema_id_or_name), 404

        return schemaService.delete(schema_id_or_name), 200

    @app.api.doc(description="Update an existing validation schema by ID", responses={
        200: "Ok, schema was updated",
        404: "Schema not found",
        400: "Invalid JSON"})
    @app.api.expect(models.schema, validate=True)
    def put(self, schema_id_or_name: str):
        """Update an existing validation schema by ID"""

        try:
            schemaService.get_by_id(schema_id_or_name)
        except SchemaNotFound:
            return "Requested schema with name/id '{}' not found".format(schema_id_or_name), 404

        schema_id = schemaService.update(schema_id_or_name, request.json)
        return {"location": "/schema/{0}".format(schema_id)}, 200
