from flask import Blueprint
from flask_restx import Api

from esdltools.core.exceptions import ApiException

# ToDo: should this be in init?

# Setup API
apiBlueprint = Blueprint('api', __name__)
api = Api(apiBlueprint, version='1.0', title='ESDL-Tools', description='ESDL statistics and validation API')

# Namespace definitions
# ns_stats = api.namespace('stats', 'ESDL statistics endpoint')
ns_validation = api.namespace('validation', 'ESDL validation endpoint')
ns_schema = api.namespace('schema', 'Validation schema endpoint')
ns_upload = api.namespace('upload', 'ESDL file upload endpoint')

# Register error handler
@api.errorhandler(ApiException)
def handle_api_exception(error):
    """Return an api exception"""
    return {"message": error.message}, error.statusCode
    