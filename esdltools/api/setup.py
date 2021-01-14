import environ
import logging

from flask import Blueprint
from flask_restx import Api

from esdltools.api import config
from esdltools.core.exceptions import ApiException

logger = logging.getLogger(__name__)


@environ.config()
class Settings:
    """App settings loaded from environment variables"""

    version = "0.1"
    title = environ.var("ESDL-Tools", name="ESDLTOOLS_TITLE")
    description = environ.var("ESDL statistics and validation API", name="ESDLTOOLS_DESCRIPTION")
    endpointPrefix = environ.var("", name="ESDLTOOLS_ENDPOINT_PREFIX")
    useDefaultCors = environ.var(False, converter=bool, name="ESDLTOOLS_DEFAULT_CORS")
    dbLocation = environ.var("schemas.db", name="ESDLTOOLS_DB_LOCATION")
    logLevel = environ.var("INFO", name="ESDLTOOLS_LOG_LEVEL")


def setup_logger(logLevel: str):
    """Setup the logger"""

    logLevel = logging.getLevelName(logLevel)
    log = logging.getLogger('werkzeug')
    log.setLevel(logLevel)
    logging.basicConfig(level=logLevel, format="%(asctime)s | %(name)s | %(levelname)s | %(message)s", datefmt="%Y-%m-%dT%H:%M:%S%z")


class AppConfig:
    def __init__(self):
        # Load config
        self.settings = Settings.from_environ()

        # Setup the logger
        setup_logger(self.settings.logLevel)
        logger.info("Setting up app")

        # Setup flask/restx, namespaces
        self.apiBlueprint = Blueprint("api", __name__)
        self.api = Api(self.apiBlueprint, version=self.settings.version, title=self.settings.title, description=self.settings.description)
        self.ns_validation = self.api.namespace("validation", "ESDL validation endpoint")
        self.ns_schema = self.api.namespace("schema", "Validation schema endpoint")

        # Setup our ApiException handler
        @self.api.errorhandler(ApiException)
        def handle_api_exception(error):
            logger.info("{0} raised, statusCode: {1}, message: {2}".format(error.__class__.__name__, error.statusCode, error.message))
            return {"message": error.message}, error.statusCode
