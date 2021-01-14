# ESDL-Tools V1.0
Service with tools for the ESDL ecore model, the service currently supports functionality for validating an ESDL model against user defined validation schemas. 

## ToDo
[ ] Better logging setup
[ ] Validate also should check against xsd
[ ] More unit tests
[ ] Unit tests for api controllers and services (mock)
[ ] More select functions
[ ] More check functions
[ ] Default 404 handling
[ ] Validation/checking of posted validation schemas

## Endpoints
Swagger documentation of the endpoints can be viewed by navigating to the root of the service. The services does not contain authentication/authorization, this can be done within your own setup with something like traefik.

### schema
This endpoint can be used to manage the validation schemas. Validation schemas are used to validate an ESDL document.

- retrieve all schemas ```GET /schema```
- retrieve schema by id ```GET /schema/{id}```
- post a new schema ```POST /schema```

### validation
validation endpoint expects multipart/form-data since we want to send an ESDL file with extra request parameters such as schema id's, posting json with the ESDL as base64 string will have too much overhead with larger ESDL files.

- validate an esdl document against one or more schemas ```POST /validation```

### stats
- Not implemented yet

## validation schema
ToDo: information about validation schemas

## Local development
Setup a development environment using virtual environment and install the dependencies. For Visual Studio Code a default settings.json can be found under ```.vscode/settings.json.default``` paste these settings into a new file ```.vscode/settings.json```. Make sure the ```python.pythonPath``` is pointing to python in your virtual env. The default settings file exclude some unwanted files and folders, styling and discovery and settings for unit tests.

### Virtual environment
Install virtual environment if not installed yet
```
python3 -m pip install --user virtualenv
```

Create a virtual environment
```
python3 -m venv env
```

Enable virtual environment with one of the following commands
```
source env/bin/activate    (Linux)
env\Scripts\activate.ps1 (Windows Powershell)
env\Scripts\activate.bat (Windows CMD)
```

### Install project dependencies
```
pip3 install -r requirements.txt
```

### Testing
Use the 'Test' tab is vscode or execute the following command from the root folder
```
python3 -m unittest discover ./
```

### Run API in develop/debug mode
To run the API in debug mode using the build in flask development server
```
python3 app.py
```

### Run API using waitress
```
waitress-serve --listen="*:8080" --call "esdltools.api.manage:create_app"
```

### Update static ESDL metamodel code
To update the ESDL code to work with the latest version of the ESDL ecore model, update esdl.ecore to the latest version and run
```
pip3 install pyecoregen
pyecoregen -e esdl.ecore -o ./esdltools/cores/esdl
```

## Deployment

### Settings
Settings can be changed using environment variables

DB_LOCATION - location and name of database, default: schemas.db

### Docker

#### Build
```
docker build -t geodan/esdl-tools .
```

## Validation

### Functions

#### Select

#### Check

#### Adding functions

#### Validation Schemas
