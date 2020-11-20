import json
import urllib

from flask import request
from flask_restx import Api, Resource, fields
from views.setup import api, ns_validation

post_body = api.model('PostBody', {
    'schema': fields.String
})

@ns_validation.route('/')
class Validation(Resource):

    @ns_validation.doc(description='Get a list of validation schemas')
    def get(self):
        return {'hello': 'world'}, 200

    @api.expect(post_body)
    @ns_validation.doc(description='Post a new validation schema')
    def post(self):
        post_body = json.loads(request.get_data().decode("utf-8"))
        esdl_string = urllib.parse.unquote(post_body["schema"])
        return esdl_string
