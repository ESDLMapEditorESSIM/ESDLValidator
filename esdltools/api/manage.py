from flask import Flask
from flask_cors import CORS

from esdltools.api.controller.setup import apiBlueprint
from esdltools.api.controller.validation import api as validationApi
from esdltools.api.controller.schema import api as schemaApi


def create_app():
    """Setup and return the flask app"""

    app = Flask(__name__)
    app.register_blueprint(apiBlueprint, url_prefix='')
    app.config["ERROR_404_HELP"] = False
    CORS(app, resources={r"*": {"origins": "*"}})

    @app.after_request
    def after_request(response):
        response.headers.add('Access-Control-Allow-Origin', '*')
        response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
        response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
        return response

    return app
