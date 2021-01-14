from flask import Flask, make_response, render_template_string
from flask_cors import CORS

from esdlvalidator.api import app as esdlvalidator
from esdlvalidator.api.controller.validation import app as validationApi
from esdlvalidator.api.controller.schema import app as schemaApi


def create_app():
    """Setup and return the flask app"""

    app = Flask(__name__)
    app.register_blueprint(esdlvalidator.apiBlueprint, url_prefix=esdlvalidator.settings.endpointPrefix)
    app.config["ERROR_404_HELP"] = False

    @app.errorhandler(404)
    def page_not_found(e):
        return make_response(render_template_string('''<!doctype html><html><head><style>*{transition: all 0.6s;}html {height: 100%;}body{font-family: 'Lato', sans-serif;color: #888;margin: 0;}#main{display: table;width: 100%;height: 100vh;text-align: center;}.fof{display: table-cell;vertical-align: middle;}.fof h1{font-size: 50px;display: inline-block;padding-right: 12px;animation: type .5s alternate infinite;}@keyframes type{from{box-shadow: inset -3px 0px 0px #888;}to{box-shadow: inset -3px 0px 0px transparent;}}</style></head><body><div id="main"><div class="fof"><h1>Error 404</h1></div></div></body></html>'''))

    if esdlvalidator.settings.useDefaultCors:
        CORS(app, resources={r"*": {"origins": "*"}})

        @app.after_request
        def after_request(response):
            response.headers.add("Access-Control-Allow-Origin", "*")
            response.headers.add("Access-Control-Allow-Headers", "Content-Type,Authorization")
            response.headers.add("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE")
            return response

    return app
