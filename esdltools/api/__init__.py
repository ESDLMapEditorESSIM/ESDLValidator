from flask import Blueprint
from flask_restx import Api

from esdltools.core.exceptions import ApiException
from esdltools.api.config import AppConfig

# Load config
config = AppConfig.from_environ()

# Setup API
apiBlueprint = Blueprint("api", __name__)
api = Api(apiBlueprint, version=config.version, title=config.title, description=config.description)

# Namespace definitions
ns_validation = api.namespace("validation", "ESDL validation endpoint")
ns_schema = api.namespace("schema", "Validation schema endpoint")


@api.errorhandler(ApiException)
def handle_api_exception(error):
    """Return an api exception"""

    return {"message": error.message}, error.statusCode
