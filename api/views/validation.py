from flask_restx import Api, Resource, fields
from collections import OrderedDict
from api.views.api import api, ns_validation


todo = api.model('Todo', {
    'id': fields.Integer(readonly=True, description='The task unique identifier'),
    'task': fields.String(required=True, description='The task details')
})

@ns_validation.route('/')
class Validation(Resource):
    '''Show a single todo item and lets you delete them'''
    @ns_validation.doc(description='Get a list of stats')
    def get(self):
        return {'hello': 'world'}
