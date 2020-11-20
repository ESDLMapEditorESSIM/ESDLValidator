from flask import Blueprint
from flask_restx import Api

# ToDo: should this be in init?

# Setup API
apiBlueprint = Blueprint('api', __name__)
api = Api(apiBlueprint, version='1.0', title='ESDL-Tools', description='ESDL statistics and validation API')

# Namespace definitions
ns_stats = api.namespace('stats', 'Stats methods')
ns_validation = api.namespace('validation', 'Validation endpoint')
