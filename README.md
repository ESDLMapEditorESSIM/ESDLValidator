# ESDL-Tools
Service with tools for the ESDL ecore model, the service currently supports functionality for validating an ESDL model against user defined validation schemas. 

## Endpoints
Swagger documentation of the endpoints can be viewed by navigating to the root of the service. The services does not contain authentication/authorization, this can be done within your own setup with something like traefik.

### schema
This endpoint can be used to manage the validation schemas. Validation schemas are used to validate an ESDL document.

- retrieve all schemas ```GET /schema```
- retrieve schema by id ```GET /schema/{id}```
- post a new schema ```POST /schema```

### validation
- validate an esdl document against one or more schemas ```POST /validation```

### stats
- Not implemented yet

## validation schema
ToDo: information about validation schemas

## Local development
Setup a development environment using virtual environment and install the dependencies

### Virtual environment
Install virtual environment if not installed yet
```
apt-get install python3-venv
```

Create virtual environment
```
python3 -m venv env
```

Enable virtual environment
```
source env/bin/activate
```

Windows powershell or cmd
```
.\env\Scripts\activate.ps1
.\env\Scripts\activate.bat
```

### Install dependencies
Install project requirements
```
pip3 install -r requirements.txt
```

### Testing
To run all esdl-tools tests run
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
