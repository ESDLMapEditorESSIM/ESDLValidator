import uuid
from datetime import datetime as dt
from math import cos, sin, atan2, sqrt, radians, degrees

from flask import request, Response
from flask_restx import Resource
from esdlvalidator.api import app
from esdlvalidator.api.controller import validationService
from esdlvalidator.core.esdl import EnergySystemInformation, Notes, Line, Point, Polygon, Note
from esdlvalidator.core.esdl.esh import StringURI

parser = app.api.parser()


@app.ns_validation_to_notes.route('/')
class ValidationToNotesController(Resource):
    """Validate an ESDL file and return an ESDL with notes"""

    @app.ns_validation_to_notes.doc(description="Post a new validation schema", responses={
        200: "Ok",
        404: "Schema not found",
        400: "Unknown filetype, Invalid ESDL"})
    @app.api.expect(parser, validate=True)
    def post(self):
        """Validate an ESDL file against one or more validation schemas"""

        file = request.data.decode('utf-8')
        if "schemas" not in request.args:
            return "Bad Request: Required 'schemas' parameter missing", 400
        schema_list = [int(id) for id in request.args['schemas'].split(',')]
        result = validationService.validateContents(file, schema_list)

        esdl_resource = validationService.esdl
        self.update_esdl(esdl_resource, result)
        uri = StringURI('to_string.esdl')
        esdl_resource.save(uri)

        return Response(response=uri.getvalue(), status=200, mimetype='text/xml')

    def update_esdl(self, resource, results: dict):
        asset_notes = {}
        es = resource.contents[0]
        esi = es.energySystemInformation
        now = dt.now()
        if esi is None:
            esi = EnergySystemInformation()
            es.energySystemInformation = esi
            esi.id = str(uuid.uuid4())
            esi.name = "EnergySystemInformation"

        notes = esi.notes
        if notes is None:
            notes = Notes()
            esi.notes = notes
            notes.id = str(uuid.uuid4())
            notes.name = "Validation Notes"

        for schema in results['schemas']:
            for validation in schema['validations']:
                if "errors" in validation:
                    for error in validation['errors']:
                        if isinstance(error, dict):
                            asset_id = error["offending_asset"]
                            message = error["message"]
                            if asset_id in asset_notes:
                                note = asset_notes[asset_id]
                                note.text = note.text + "\nERROR: {}".format(message)
                            else:
                                asset = resource.uuid_dict[asset_id]
                                p = self.get_center_point(asset)
                                note = Note(id=str(uuid.uuid4()), mapLocation=p, author="ESDLValidatorService",
                                            title=asset_id, text="ERROR: {}".format(message), date=now)
                                asset_notes[asset_id] = note
                if "warnings" in validation:
                    for warning in validation['warnings']:
                        if isinstance(warning, dict):
                            asset_id = warning["offending_asset"]
                            message = warning["message"]
                            if asset_id in asset_notes:
                                note = asset_notes[asset_id]
                                note.text = note.text + "\nWARNING: {}".format(message)
                            else:
                                asset = resource.uuid_dict[asset_id]
                                p = self.get_center_point(asset)
                                note = Note(id=str(uuid.uuid4()), mapLocation=p, author="ESDLValidatorService",
                                            title=asset_id, text="WARNING: {}".format(message), date=now)
                                asset_notes[asset_id] = note
        for n in asset_notes.values():
            notes.note.append(n)
        return es

    @staticmethod
    def get_center_point(asset):
        geometry = asset.geometry
        points = None
        if isinstance(geometry, Polygon):
            points = geometry.exterior
        elif isinstance(geometry, Line):
            points = geometry.point
        elif isinstance(geometry, Point):
            points = [geometry]
        x = []
        y = []
        z = []
        for p in points:
            x.append(cos(radians(p.lat)) * cos(radians(p.lon)))
            y.append(cos(radians(p.lat)) * sin(radians(p.lon)))
            z.append(sin(radians(p.lat)))

        x_avg = (sum(x) / len(x))
        y_avg = (sum(y) / len(y))
        z_avg = (sum(z) / len(z))

        lon = atan2(y_avg, x_avg)
        hyp = sqrt(x_avg * x_avg + y_avg * y_avg)
        lat = atan2(z_avg, hyp)

        return Point(lat=degrees(lat), lon=degrees(lon))
