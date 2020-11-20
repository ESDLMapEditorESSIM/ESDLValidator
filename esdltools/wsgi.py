from flask import Flask
from flask_cors import CORS
from views.setup import apiBlueprint
from views.statistics import api as statsApi
from views.validation import api as validationApi


def create_app():
    """Setup and return the flask app"""

    app = Flask(__name__)
    app.register_blueprint(apiBlueprint, url_prefix='')
    CORS(app, resources={r"*": {"origins": "*"}})

    @app.after_request
    def after_request(response):
        response.headers.add('Access-Control-Allow-Origin', '*')
        response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
        response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
        return response

    return app


if __name__ == '__main__':
    """Run ESDL API in debug mode"""

    app = create_app()
    app.run(debug=True)
