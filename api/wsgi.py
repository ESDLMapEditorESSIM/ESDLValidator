from flask import Flask
from flask_cors import CORS
from api.views.api import esdlApi
from api.views.statistics import api as statsApi
from api.views.validation import api as validationApi


app = Flask(__name__)
app.register_blueprint(esdlApi, url_prefix='/')
cors = CORS(app, resources={r"/*": {"origins": "*"}})


@app.after_request
def after_request(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
    return response

def create_app():
    """Returns the flask app, this function is called by waitress"""
    return app

if __name__ == '__main__':
    """Run ESDL API in debug mode"""
    app.run(debug=True)
