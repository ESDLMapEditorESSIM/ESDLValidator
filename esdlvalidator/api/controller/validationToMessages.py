import json

from flask import request, Response
from flask_restx import Resource

from esdlvalidator.api import app
from esdlvalidator.api.controller import validationService
from esdlvalidator.core.exceptions import SchemaNotFound

parser = app.api.parser()
parser.add_argument("data", type=str, required=True)
parser.add_argument("schemas", type=str, help="List of schema id's, comma separated", required=True)


@app.ns_validation.route('/validationToMessages')
class ValidationToMessagesController(Resource):

    @app.ns_validation.doc(description="Post a new validation schema", responses={
        200: "Ok",
        404: "Schema not found",
        400: "Unknown filetype, Invalid ESDL"})
    @app.api.expect(parser, validate=True)
    def post(self):
        """Validate an ESDL file against one or more validation schemas and return JSON"""
        if request.data:
            # 'Contains the incoming request data as string in case it came with a mimetype Flask does not handle'
            # > Happens with requests from the mapeditor
            file = request.data.decode('utf-8')
        else:
            # with openapi
            file = request.args['data']

        if "schemas" not in request.args:
            return "Bad Request: Required 'schemas' parameter missing", 400
        schema_list = [id for id in request.args['schemas'].split(',')]
        try:
            result = validationService.validateContents(file, schema_list)
        except SchemaNotFound as e:
            return e.message, 400

        json_result = []

        if 'schemas' in result:
            for schema in result['schemas']:
                if 'validations' in schema:
                    for validation in schema['validations']:
                        if 'errors' in validation:
                            for error in validation['errors']:
                                if 'offending_asset' in error:
                                    asset = error['offending_asset']
                                    msgs = self.get_messages(json_result, asset)
                                    msgs.append({'message': error['message'], 'severity': 'ERROR'})
                                    json_result = self.set_messages(json_result, asset, msgs)
                        if 'warnings' in validation:
                            for warning in validation['warnings']:
                                if 'offending_asset' in warning:
                                    asset = warning['offending_asset']
                                    msgs = self.get_messages(json_result, asset)
                                    msgs.append({'message': warning['message'], 'severity': 'WARNING'})
                                    json_result = self.set_messages(json_result, asset, msgs)

        return Response(response=json.dumps(json_result), status=200, mimetype='text/json')

    @staticmethod
    def get_messages(result, asset):
        for element in result:
            if element["assetID"] == asset:
                return element["messages"]
        return []

    @staticmethod
    def set_messages(result, asset, msgs):
        for element in result:
            if element["assetID"] == asset:
                element["messages"] = msgs
                return result
        result.append({"assetID": asset, "messages": msgs})
        return result
