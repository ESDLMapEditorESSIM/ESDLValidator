import environ
import logging

from flask import Blueprint
from flask_restx import Api

logger = logging.getLogger(__name__)


@environ.config()
class Settings:
    """App settings loaded from environment variables"""

    version = "0.1"
    title = environ.var("ESDL-Validator", name="ESDLVALIDATOR_TITLE")
    description = environ.var("API for validating ESDL files", name="ESDLVALIDATOR_DESCRIPTION")
    endpointPrefix = environ.var("", name="ESDLVALIDATOR_ENDPOINT_PREFIX")
    useDefaultCors = environ.var(False, converter=bool, name="ESDLVALIDATOR_DEFAULT_CORS")
    dbLocation = environ.var("schemas.db", name="ESDLVALIDATOR_DB_LOCATION")
    logLevel = environ.var("INFO", name="ESDLVALIDATOR_LOG_LEVEL")


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
