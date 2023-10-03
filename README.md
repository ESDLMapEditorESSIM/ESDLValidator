# ESDL-Validator
Service for validating ESDL files against validation schemas  

## Status
**work in progress** 

# Status PoC scheme
### Checks if:
- Heatcommodity carriers availability with atleast one supply and return temperature
- Pipes are not directly connected to pipes
- No other assets than pipes are connected to joints
- there are no unconnected ports
- Joint contains exactly two ports
- [Producers, Conversion] are connected as producers (outport temperature> inport temperature)
- [Consumer, Heatstorage] are connected as consumers (outport temperature < inport temperature)
- Diameter of pipe is defined
- charge and discharge rate of Heatstorages is defined
- heatexchanger capacity is defined
- costinformation exists with children installation, investment, fixed & variable operational
  - all checked units are independent of multiplier
    - investment cost in EUR/W for producers, conversion, ATES, consumers, EUR/m3 for tank storage, EUR/m for pipes
    - installation cost in EUR for all assets except pipes and joints
    - fixed operational cost in EUR/W for producers, conversion, ATES, consumers, EUR/m3 for tank storage
    - variable operational cost in EUR/Wh for producers, conversion, ATES, consumers
- names of assets are unique
- pipes and joints have names pairs for supply and return based on + '_ret'
- power producer is defined
- consumer profile is defined

### PoC scheme ToDo:
- [ ] check minimum pipelength [warning]
- [ ] check connection of assets with more than 2 ports (heat pump and heat exchanger) [error]
- [ ] check area ....
- [ ] check power consumer is larger than max of profile [warning]
- [ ] check power consumer is not 0, because used for scaling. [error]
- [ ] check unit EUR/Wh to also allow EUR/J [warning]
- [ ] check fixed and variable maintenance to also be allowed. [warning]
- [ ] check number of assets in the ESDL. [warning]
- [ ] check if area contains atleast one asset [warning]
- [ ] check if multiplier of profile is not 0 [error]
- [ ] check name of carriers, return carrier = supplycarrier name + '_ret' [error]
- [ ] add scheme to use before duplicator
  - use same scheme without 
    - [ ] the check on how assets are connected
    - [ ] the check if also '_ret' exists for pipe and joint
    - [ ] the check if all ports are connected
    - [ ] the exclusive check if only supply or return temperature of carrier is set.

# ToDo V1.0
- [x] Handle 'and', 'or' in checks - working, need some more thoroughly testing
- [ ] Add xsd validation
- [ ] Fix waitress logging
- [ ] Better output messages for current checks
- [ ] Add type filter to get function, for instance to be able to select SingleValue of type marginalCosts, Subselect with filter on all assets is now needed (schema_test_2.json)
- [ ] More select functions
- [ ] More check functions
- [ ] More interesting validation rules to test with
- [ ] Option to log to file instead of stdout
- [ ] Accept multiple types in get function so a check can be done on multiple entities but not the parent, for example GasHeater and HeatPump 
- [ ] Versioning?
- [ ] More unit test (currently no test for api package)
- [ ] Endpoint for getting an overview of registered functions
- [ ] Simple frontend tool in a separate project
- [ ] Postman example file
- [ ] Tutorial

## Endpoints
Swagger documentation of the endpoints can be viewed by navigating to the root of the service. The services does not contain authentication/authorization, this can be done within your own setup with something like traefik.

### schema
The schema endpoint can be used to manage the validation schemas. Validation schemas are used to validate an ESDL document.

| Endpoints |  Operation  | Description |
| ------------- |:-------------| :-----|
| /schema | GET | Get a summary of schemas |
| /schema | POST | Post a new schema |
| /schema/{id} | GET | Get a schema by id |
| /schema/{id} | PUT | Update a schema by id |
| /schema/{id} | DELETE | Delete a schema by id |

### validation
validation endpoint expects multipart/form-data since we want to send an ESDL file with extra request parameters such as schema id's, posting json with the ESDL as base64 string will have too much overhead with larger ESDL files.

| Endpoints |  Operation  | Description |
| ------------- |:-------------| :-----|
| /validation | POST | Validate an ESDL against given schemas |

### Settings
esdl-validator can be configured using the following environment variables.

| Variable | Description | default  |
| ------------- |:-------------| :-----|
| ESDLVALIDATOR_TITLE | Title of the service, shown in swagger | ESDL-Validator |
| ESDLVALIDATOR_DESCRIPTION | Description of the service, shown in swagger | API for validating ESDL files |
| ESDLVALIDATOR_ENDPOINT_PREFIX | Prefix of the endpoint, for example /api | - |
| ESDLVALIDATOR_DB_LOCATION | location and name of database | schemas.db |
| ESDLVALIDATOR_DEFAULT_CORS | Enable the default CORS, accepting everything | False |
| ESDLVALIDATOR_LOG_LEVEL | Set the log level: CRITICAL, ERROR, WARNING, INFO, DEBUG | INFO |

## validation schema
ToDo: information on how a validatio schema is constructed

## Local development
Setup a development environment using virtual environment and install the dependencies. For Visual Studio Code a default settings.json can be found under ```.vscode/settings.json.default``` paste these settings into a new file ```.vscode/settings.json```. Make sure the ```python.pythonPath``` is pointing to python in your virtual env. The default settings file excludes some unwanted files and folders, styling and discovery and settings for unit tests.

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
Use the 'Test' tab is vscode or execute one of the following commands from the root folder
```
pytest
python3 -m unittest discover ./
```

### Run ESDL-validator in develop/debug mode
To run the service in debug mode using the build in flask development server.
```
python3 app.py
```

### Run ESDL-validator using waitress
An example how to start the service using waitress.
```
waitress-serve --listen="*:8080" --call "esdlvalidator.api.manage:create_app"
```

### Update static ESDL metamodel code
To update the ESDL code to work with the latest version of the ESDL ecore model, update esdl.ecore to the latest version and run
```
pip3 install pyecoregen
pyecoregen -e esdl.ecore -o ./esdlvalidator/core/esdl
```

## Docker

Build example
```
docker build -t esdl-validator .
```

The docker image is by default configured to create/read the database file from /storage/schemas.db, this can be updated by setting ESDLVALIDATOR_DB_LOCATION

Run example for esdl-validator with logging set to DEBUG and the database file stored and read outside of the container.
```
docker run -p 8080:80 -v C:\temp:/storage -e ESDLVALIDATOR_LOG_LEVEL=DEBUG esdl-validator
```

The service should now be accesible on ```localhost:8080```

## Validation
ToDo

### Functions
There are 2 types of functions: select and check. Select functions are used to generate a 'dataset' which can be used in a check functions. In one validation schema multiple selects can be defined to select data from the esdl, filter out data or generate new data such for example calculating an average. Check functions test every entry in the given dataset and return a result (for every entry) which will be returned by the service, check function can generate warnings or errors based on how the check is configured in the validation schema. New functions can be added easily, by adding ```@FunctionFactory.register``` to the class, giving it a name and extending the appropriate function type the function will be discovered automatically by the FunctionFactory. To use a function simply reference the function by it's name in the validation schema i.e ```"function": "not_null"```

#### Select
ToDo: Instructions on the select function and how to add new ones

#### Check
ToDo: Instructions on the check function and how to add new ones
