import json
import urllib

from flask import request
from flask_restx import Api, Resource, fields

from esdltools.api.controller.setup import api, ns_validation


@ns_validation.route('/')
class ValidationController(Resource):

    @ns_validation.doc(description='Get a list of validation schemas')
    def get(self):
        return "Hello", 200

