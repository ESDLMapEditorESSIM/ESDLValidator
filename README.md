# ESDL-Validator
Service for validating [Energy System Description Language](https://energytransition.gitbook.io/esdl/) (ESDL) files against XSD and user defined validation schemas  

# ToDo
- [x] Handle 'and', 'or' in checks - working, need some more thoroughly testing
- [x] Add xsd validation
- [x] More select functions
- [x] More check functions
- [x] More interesting validation rules to test with
- [x] Postman example file
- [ ] Waitress logging passed to the logger
- [ ] Better output messages for current checks (include entity id if exists)
- [ ] Add type filter to get function, for instance to be able to select SingleValue of type marginalCosts, Subselect with filter on all assets is now needed (schema_test_2.json)
- [ ] Option to log to file instead of stdout
- [ ] Accept multiple types in get function so a check can be done on multiple entities but not the parent, for example GasHeater and HeatPump 
- [ ] Versioning, check posted ESDL version and check against the correct XSD and pyecore generated code?
- [ ] More unit test, currently no test for api package
- [ ] Endpoint for getting an overview of registered functions

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
Validation endpoint expects multipart/form-data since we want to send an ESDL file with extra request parameters such as schema id's, posting json with the ESDL as base64 string will have too much overhead with larger ESDL files.

| Endpoints |  Operation  | Description |
| ------------- |:-------------| :-----|
| /validation | POST | Validate an ESDL against given schemas and xsd |

### Settings
The esdl-validator service can be configured using the following environment variables.

| Variable | Description | default  |
| ------------- |:-------------| :-----|
| ESDLVALIDATOR_HOSTNAME | Hostname to run the service on | localhost |
| ESDLVALIDATOR_PORT | Port to run the service on | 5000 |
| ESDLVALIDATOR_TITLE | Title of the service, shown in swagger | ESDL-Validator |
| ESDLVALIDATOR_DESCRIPTION | Description of the service, shown in swagger | API for validating ESDL files |
| ESDLVALIDATOR_ENDPOINT_PREFIX | Prefix of the endpoint, for example /api | - |
| ESDLVALIDATOR_DB_LOCATION | location and name of database | schemas.db |
| ESDLVALIDATOR_DEFAULT_CORS | Enable the default CORS, accepting everything | False |
| ESDLVALIDATOR_LOG_LEVEL | Set the log level: CRITICAL, ERROR, WARNING, INFO, DEBUG | INFO |
| ESDLVALIDATOR_REPOSITORY_TYPE | Set the repository type, options FILE, MONGO | FILE |
| ESDLVALIDATOR_MONGODB_HOST | Hostname of MongoDB, only set when using Mongo | localhost |
| ESDLVALIDATOR_MONGODB_PORT | Port of MongoDB, only set when using Mongo | 27017 |

## Local development
Setup a development environment using virtual environment and install the dependencies. For Visual Studio Code a default settings.json can be found under ```.vscode/settings.json.default``` paste these settings into a new file ```.vscode/settings.json```. Make sure the ```python.pythonPath``` is pointing to python in your virtual env. The default settings file excludes some unwanted files and folders, styling and discovery and settings for unit tests.

### Virtual environment
Install virtual environment if not installed yet
```
python -m pip install --user virtualenv
```

Create a virtual environment
```
python -m venv env
```

Enable virtual environment with one of the following commands
```
source env/bin/activate    (Linux)
env\Scripts\activate.ps1 (Windows Powershell)
env\Scripts\activate.bat (Windows CMD)
```

### Install project dependencies
```
pip install -r requirements.txt
```

### Testing
Use the 'Test' tab is vscode or execute one of the following commands from the root folder.
```
python -m unittest discover ./
```

### Run ESDL-validator in develop/debug mode
To run the service in debug mode using the build-in flask development server.
```
python app.py
```

### Run ESDL-validator using waitress
An example how to start the service using waitress.
```
waitress-serve --listen="*:8080" --call "esdlvalidator.api.manage:create_app"
```

### Update static ESDL metamodel code
To update the ESDL code to work with the latest version of the ESDL ecore model, update esdl.ecore to the latest version and run
```
pip install pyecoregen
pyecoregen -e esdl.ecore -o ./esdlvalidator/core/esdl
```

## Postman
A Postman collection with some examples how to use the ESDLValidator can be found at ```testdata/ESDLValidator.postman_collection.json``` This collection can be imported into Postman using the ```import``` button in the top left corner of the application. All requests start with {{host}} this is a variable declared in the collection and is set to ```127.0.0.1:5000``` When running the ESDLValidator service somewhere else, update the ```host``` variable in the collection or add and use a [Postman environment](https://learning.postman.com/docs/sending-requests/managing-environments/) with a ```host``` variable.  

For the request ```validation/POST validation``` make sure to update the file value in the body tab with your own ESDL or the test ESDL ```testdata/hybrid_hp_with_pv_storage.esdl``` which can be found in this repo. 

## Docker

Build example
```
docker build -t esdl-validator .
```

The docker image is by default configured to create/read the database file from /storage/schemas.db, this can be updated by setting ESDLVALIDATOR_DB_LOCATION

Run example for esdl-validator with logging set to DEBUG and the database file stored and read outside of the container.
```
docker run -p 8080:5000 -v C:\temp:/storage -e ESDLVALIDATOR_LOG_LEVEL=DEBUG esdl-validator
```

The service should now be accesible on ```localhost:8080```

## Validation Schema
The ESDL-Validator service can validate ESDL files against XSD and user defined validation schemas, the service can be extended easily with new functions and endpoints if the current features lack the ability to suit your needs. When a validation request is send to the service it will get validated against the given schema (or multiple schemas). A validation schema contains name, description and an array of validations.

```
{
    "name": "my_schema",
    "description": "Example validation schema",
    "validations": [...]
}
```

### Validation
A validation contains a name, description, type, message, a list of select functions and a check function. The type can be ```error``` or ```warning``` to describe if the validation generates warnings or errors. The message is a text that will be prefixed to generated warning or error message. 

```
"validations": [
    {
        "name": "my_validation_1",
        "description": "Example validation 1",
        "type": "warning",
        "message": "my_validation_1 warning",
        "selects": [
            { "GET FUNCTION" }
        ],
        "check": { "CHECK FUNCTION }
]
```

### Functions
There are 2 types of functions: select and check. Select functions are used to generate a 'dataset' which can be used in a check functions. In one validation schema multiple selects can be defined to select data from the esdl, filter out data or generate new data such for example calculating an average. Check functions test every entry in the given dataset and return a result (for every entry) which will be returned by the service, check function can generate warnings or errors based on how the check is configured in the validation schema. New functions can be added easily, by adding ```@FunctionFactory.register``` to the class, giving it a name and extending the appropriate function type the function will be discovered automatically by the FunctionFactory. To use a function simply reference the function by it's name in the validation schema i.e ```"function": "not_null"``` All current functions can be found under esdlvalidator/validation/functions, the arguments and their description that can be set for each function can be found in their .py file, it should also be possible to make an endpoint to describe all registered functions, this is not yet implemented.

#### Select
Example selecting Producer Assets and storing it in a 'producers' dataset which can be used in other select or check functions. "function": "get" will execute the select_get.py since this function is registered as "get".

```
"selects": [
    {
        "function": "get",
        "alias": "producers",
        "args": {
            "type": "Producer"
        }
    }
],
```

Example getting the average power of gasheaters in an ESDL
```
"selects": [
    {
        "function": "get",
        "alias": "gasheaters",
        "args": {
            "type": "GasHeater"
        }
    },
    {
        "function": "avg",
        "alias": "avg_gasheater_power",
        "args": {
            "property": "power",
            "dataset": "gasheaters"
        }
    }
],
```

#### Check
Example check function, this example checks if every GasHeater has a propery costinformation.marginalcosts filled in. The "dataset" is set to "gasheaters" which means use the dataset with the alias "gasheaters" which should be a result of a previous select function, see the example above.

```
"check": {
    "function": "not_null",
    "dataset": "gasheaters",
    "args": {
        "property": "costinformation.marginalcosts"
    }
}
```

Every check can also contain and + or functions, example to check if producers has a power and costinformation.marginalcosts.value or else contains a port.profile

```
"check": {
    "function": "not_null",
    "dataset": "producers",
    "args": {
        "property": "power",
        "counts_as_null": [
            0.0
        ]
    },
    "and": [
        {
            "function": "not_null",
            "args": {
                "property": "costinformation.marginalcosts.value",
                "counts_as_null": [
                    0.0
                ]
            }
        }
    ],
    "or": [
        {
            "function": "not_null",
            "args": {
                "property": "port.profile"
            }
        }
    ]
}
```

More complete examples can be found under the folder testdata
```
schema_test_1.json
schema_test_2.json
schema_vesta_bronnen.json
schema_vesta_nieuwbouw.json
```


### Validation result
The validation result send back from the validation endpoint consists of xsdValidation and esdlValidation where xsdValidation is the result of the validation of the ESDL file against the latest ESDL XSD schema and esdlValidation the result of the user defined schemas. Below is an example validation result for buurt_maatregelen.esdl using the schema_vesta_bronnen.json. The XSD is invalid, apparently the ESDL can be read but the XSD did not expect an area element on line 5. buurt_maatregelen.esdl is also not valid for schema "vesta_heatsource" since it found 3 errors.

```
{
  "xsdValidation": {
    "valid": false,
    "version": "v2101-dev",
    "errors": [
      "ERROR ON LINE 5: Element 'area': This element is not expected."
    ]
  },
  "esdlValidation": {
    "valid": false,
    "errorCount": 15,
    "warningCount": 55,
    "schemas": [
      {
        "name": "vesta_heatsource",
        "description": "VESTA validation example for Heatsource ESDL files",
        "validations": [
          {
            "name": "contains_not_supported_assets",
            "description": "Check if areas contain assets other than ResidualHeatSource",
            "checked": 555,
            "warnings": [
              "Unsupported Asset found: Object 6d0e8488-e5ad-45cf-bf0c-53889463266f is not of type ResidualHeatSource",
              "Unsupported Asset found: Object addbc1ea-6f3b-412a-8ff5-93c74060dd59 is not of type ResidualHeatSource",
              "Unsupported Asset found: Object 3e073b05-af55-4df6-8a98-a1f0a76cf5d6 is not of type ResidualHeatSource",
              ............
            ]
          },
          {
            "name": "check_residual_heat_source_valid",
            "description": "Check if all ResidialHeatSource assets are valid for VESTA, ResidualHeatSource should contain a name, power and geometry",
            "checked": 514,
            "errors": [
              "Invalid ResidualHeatSource: power cannot be null for entity dca3dccd-d24f-4488-9a43-a1be76e07f15",
              "Invalid ResidualHeatSource: power cannot be null for entity aea162b9-11c5-41de-ae5b-a50d073c0739",
              "Invalid ResidualHeatSource: property geometry value is None",
              ............
            ]
          },
          {
            "name": "check_residual_heat_source_dates",
            "description": "Check if all ResidialHeatSource assets have a commissioningDate and decommissioningDate",
            "checked": 514,
            "warnings": [
              "ResidualHeatSource missing commissioningDate or DecommissioningDate: property commissioningDate value is None",
              "ResidualHeatSource missing commissioningDate or DecommissioningDate: property commissioningDate value is None",
              ............
            ]
          }
        ]
      }
    ]
  }
}
```