# ESDL-Tools
Service with tools for the ESDL ecore model, the service currently supports functionality for validating an ESDL model against validation schema's. In the future this service will have more functionalit such as getting statistics from an ESDL.

## Setup dev environment
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

### Run API in develop/sebug mode
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

### Docker

#### Build
```
docker build -t geodan/esdl-tools .
```

## Validation

### Endpoints

### Functions

#### Select

#### Check

#### Adding functions

#### Validation Schemas

## Statistics