import uuid
from math import cos, sin, atan2, sqrt, radians, degrees

from flask import request, Response
from flask_restx import Resource
from werkzeug.datastructures import FileStorage
from esdlvalidator.api import app
from esdlvalidator.api.controller import validationService
from esdlvalidator.core.esdl import utils, EnergySystem, EnergySystemInformation, Notes, Line, Point, Geometry, Polygon, \
    Note
from esdlvalidator.core.esdl.esh import StringURI
from datetime import datetime as dt

parser = app.api.parser()
parser.add_argument("file", type=FileStorage, location="files", required=True)
parser.add_argument("schemas", type=list, help="List of schema id's, comma separated", location="form", required=True)


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

        file = request.files["file"]
        schemas = [int(id) for id in request.form["schemas"].split(',')]
        result = validationService.validate(file, schemas)

        esdl_resource = validationService.esdl
        self.update_esdl(esdl_resource, result)
        uri = StringURI('to_string.esdl')
        esdl_resource.save(uri)

        return Response(response=uri.getvalue(), status=200, mimetype='text/xml')

    def update_esdl(self, resource, results: dict):
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
                            asset = resource.uuid_dict[error["offending_asset"]]
                            p = self.get_center_point(asset)
                            note = Note(id=str(uuid.uuid4()), mapLocation=p, author="ESDLValidatorService",
                                        title="ERROR ({})".format(error["offending_asset"]), text=error["message"],
                                        date=now)
                            notes.note.append(note)
                if "warnings" in validation:
                    for warning in validation['warnings']:
                        if isinstance(warning, dict):
                            asset = resource.uuid_dict[warning["offending_asset"]]
                            p = self.get_center_point(asset)
                            note = Note(id=str(uuid.uuid4()), mapLocation=p, author="ESDLValidatorService",
                                        title="WARNING ({})".format(warning["offending_asset"]),
                                        text=warning["message"], date=now)
                            notes.note.append(note)
        print('done')
        return es

    def get_center_point(self, asset):
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
