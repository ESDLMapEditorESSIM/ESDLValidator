from flask import Blueprint
from flask_restx import Api

from esdltools.core.exceptions import ApiException
from esdltools.settings.config import AppConfig

# Setup API
apiBlueprint = Blueprint("api", __name__)
api = Api(apiBlueprint, version=AppConfig.app_version, title=AppConfig.app_title, description=AppConfig.app_description)

# Namespace definitions
ns_validation = api.namespace("validation", "ESDL validation endpoint")
ns_schema = api.namespace("schema", "Validation schema endpoint")

# Register default error handler


@api.errorhandler(ApiException)
def handle_api_exception(error):
    """Return an api exception"""

    return {"message": error.message}, error.statusCode
