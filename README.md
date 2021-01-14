# ESDL-Validator
Service for validating an ESDL model against user defined validation schemas. 

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
waitress-serve --listen="*:8080" --call "esdlvalidator.api.manage:create_app"
```

### Update static ESDL metamodel code
To update the ESDL code to work with the latest version of the ESDL ecore model, update esdl.ecore to the latest version and run

```
pip3 install pyecoregen
pyecoregen -e esdl.ecore -o ./esdlvalidator/core/esdl
```

## Deployment

### Settings
Settings can be changed using environment variables

ESDLVALIDATOR_TITLE - Title of the service, shown in swagger. default: "ESDL-Validator"
ESDLVALIDATOR_DESCRIPTION - Description of the service, shown in swagger. default: "ESDL statistics and validation API"
ESDLVALIDATOR_ENDPOINT_PREFIX - Prefix of the endpoint, for example /api. default: ""
ESDLVALIDATOR_DB_LOCATION - location and name of database, default: schemas.db
ESDLVALIDATOR_DEFAULT_CORS - Enable CORS. default: False
ESDLVALIDATOR_LOG_LEVEL - Set the log level (CRITICAL, ERROR, WARNING, INFO, DEBUG, NOTSET) default: INFO

### Docker

Build
```
docker build -t esdl-validator .
```

The docker image is by default configured to create/read the database file from /storage/schemas.db, this can be updated by setting ESDLVALIDATOR_DB_LOCATION

Run example
```
docker run -p 8080:80 -v C:\temp:/storage -e ESDLVALIDATOR_LOG_LEVEL=DEBUG esdl-validator
```
This spins up the service with logging set to "DEBUG" and makes it available on port 8080, maps the storage folder to the local machine so the database file is kept outside of the container.

The service can now be accessed on ```localhost:8080```

## Validation
ToDo 

### Functions
ToDo 

#### Select
ToDo 

#### Check
ToDo 

#### Adding functions
ToDo 

#### Validation Schemas
ToDo 