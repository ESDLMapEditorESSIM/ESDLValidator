from flask import request, redirect, render_template_string, make_response, Response
from flask_restx import Resource, Api
from werkzeug.utils import secure_filename
import os

from esdltools.api.controller.setup import api, ns_upload


def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ['esdl']

@ns_upload.route('/')
class ESDLFileUploader(Resource):
    
    @ns_upload.doc(description='Upload an ESDL file', responses={200: "Ok", 400: "Invalid file extension"})
    def get(self):
        return make_response(render_template_string('''<!doctype html>
<html>
    <body>
        <title>Upload new File</title>
        <h1>Upload new File</h1>
        <form method=post enctype=multipart/form-data>
            <input type=file name="file" accept=".esdl">
            <input type=submit value=Upload>
        </form>
    </body>
</html>'''), 200, {'Content-Type': 'text/html'})

    @ns_upload.doc(description='Post an ESDL file')
    def post(self):
        if 'file' not in request.files:
            return make_response(render_template_string('''<!doctype html><html><body>No file, upload form should have &lt;input type="file" name="file"&gt;</body></html>'''), 400) 
        file = request.files['file']
        if file.filename == '':
            return make_response(render_template_string('''<!doctype html><html><body>No file uploaded</body></html>'''), 404)
        if file and allowed_file(file.filename):
            data = file.read()
            #return Response(data, mimetype='application/esdl+xml')
            return Response(data, mimetype='text/xml')
            #filename = secure_filename(file.filename)
            #file.save(os.path.join(os.path.dirname(os.path.realpath(__file__)), '../../../uploads', filename))
            #return make_response(render_template_string('''<!doctype html><html><body>File uploaded</body></html>'''))
            #return redirect_url(request.url) #or some location where file will be validated
        return make_response(render_template_string('''<!doctype html><html><body>Upload failed, does the file have extension '.esdl'?</body></html>'''))
        
