# ESDL-Validator

Service for validating ESDL files against validation schemas

## Usage

To start the service locally run

```bash
docker-compose up
```

Then go to `localhost:3011` to see the available endpoints.  
First upload the validation schema `testdata/schemas/schema_Poc.json` using `POST /schema`.  
`GET /schema` returns a list of the available schema id's, names and descriptions.  
`GET /schema/{schema_id_or_name}` returns a schema by id.

To run the validation use `POST /validationToMessages/` with the esdl as string (for instance
`testdata/esdls/Single_pipes.esdl`) and the schema id.
This should return a response with errors and warnings:

```json
[
  {
    "assetID": "6f45c6f8-e8e2-4378-a910-45140337b9dd",
    "messages": [
      {
        "message": "Only one of supplyTemperature or returnTemperature must be defined for asset 6f45c6f8-e8e2-4378-a910-45140337b9dd (HotSide)",
        "severity": "ERROR"
      },
      {
        "message": "6f45c6f8-e8e2-4378-a910-45140337b9dd (HotSide) does not have a parallel return asset with the name (HotSide_ret)",
        "severity": "ERROR"
      }
    ]
  },
  {
    "assetID": "e11a2daa-2e56-4635-afb3-1e23c6d08c33",
    "messages": [
      {
        "message": "e11a2daa-2e56-4635-afb3-1e23c6d08c33's OutPort is unconnected",
        "severity": "WARNING"
      }
    ]
  },
  {
    "assetID": "c407387a-ebfd-41b7-af1b-9cae7aec842b",
    "messages": [
      {
        "message": "c407387a-ebfd-41b7-af1b-9cae7aec842b's InPort is unconnected",
        "severity": "WARNING"
      }
    ]
  },
  {
    "assetID": "e677bac5-48e0-4ac0-b2a9-5a329b00b0d6",
    "messages": [
      {
        "message": "e677bac5-48e0-4ac0-b2a9-5a329b00b0d6's OutPort is unconnected",
        "severity": "WARNING"
      }
    ]
  },
  {
    "assetID": "737494af-8ac4-4ebe-a11a-e89f6f2c415a",
    "messages": [
      {
        "message": "737494af-8ac4-4ebe-a11a-e89f6f2c415a's InPort is unconnected",
        "severity": "WARNING"
      },
      {
        "message": "737494af-8ac4-4ebe-a11a-e89f6f2c415a (Pipe_7374) does not have a parallel return asset with the name (Pipe_7374_ret)",
        "severity": "ERROR"
      }
    ]
  },
  {
    "assetID": "363103d6-a32e-40a6-b3a9-ae376c944f6b",
    "messages": [
      {
        "message": "363103d6-a32e-40a6-b3a9-ae376c944f6b (Pipe_3631) does not have a parallel return asset with the name (Pipe_3631_ret)",
        "severity": "ERROR"
      }
    ]
  },
  {
    "assetID": "83582c37-b692-4432-8430-4e3407ed4c08",
    "messages": [
      {
        "message": "83582c37-b692-4432-8430-4e3407ed4c08 (Pipe_8358) does not have a parallel return asset with the name (Pipe_8358_ret)",
        "severity": "ERROR"
      }
    ]
  },
  {
    "assetID": "a5142229-9331-4313-a52b-70c3da15f4a9",
    "messages": [
      {
        "message": "a5142229-9331-4313-a52b-70c3da15f4a9 (Pipe_a514) does not have a parallel return asset with the name (Pipe_a514_ret)",
        "severity": "ERROR"
      }
    ]
  },
  {
    "assetID": "0fc640c8-7f6b-45ae-8e40-2966c1377761",
    "messages": [
      {
        "message": "0fc640c8-7f6b-45ae-8e40-2966c1377761 (Pipe_0fc6) does not have a parallel return asset with the name (Pipe_0fc6_ret)",
        "severity": "ERROR"
      }
    ]
  },
  {
    "assetID": "a0b0a95a-76c6-4afa-a319-f41297c5be6e",
    "messages": [
      {
        "message": "a0b0a95a-76c6-4afa-a319-f41297c5be6e (Pipe_a0b0) does not have a parallel return asset with the name (Pipe_a0b0_ret)",
        "severity": "ERROR"
      }
    ]
  },
  {
    "assetID": "f6779198-7d2a-456b-997b-58b9a02cdb2d",
    "messages": [
      {
        "message": "f6779198-7d2a-456b-997b-58b9a02cdb2d (Joint_f677) does not have a parallel return asset with the name (Joint_f677_ret)",
        "severity": "ERROR"
      }
    ]
  },
  {
    "assetID": "7aae2f5f-c3d4-4041-9577-d0a46124df09",
    "messages": [
      {
        "message": "7aae2f5f-c3d4-4041-9577-d0a46124df09 (Joint_7aae) does not have a parallel return asset with the name (Joint_7aae_ret)",
        "severity": "ERROR"
      }
    ]
  },
  {
    "assetID": "f5214b94-d097-4fa9-a86a-110a1386f884",
    "messages": [
      {
        "message": "f5214b94-d097-4fa9-a86a-110a1386f884 (Joint_f521) does not have a parallel return asset with the name (Joint_f521_ret)",
        "severity": "ERROR"
      }
    ]
  }
]
```

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
- power of producer, conversion, consumer is defined
- consumer profile is defined

### PoC scheme ToDo:

- [ ] check minimum pipelength [warning]
- [ ] check if there are carriers which are not used [error]
- [x] check connection of assets with more than 2 ports (heat pump and heat exchanger) [error]
- [ ] check area ...
- [x] check on heatpump information (power,COP, ....) [warning]
- [x] check tankstorage volume or capacity defined
- [ ] check power consumer is larger than max of profile [warning]
- [x] check power consumer is not 0, because used for scaling. [error]
- [ ] check aggregation count:
    - [ ] if >0 then aggregated ==True else [warning]
    - [ ] if ==0, same as disabled (asset ignored) [warning]
- [ ] check unit EUR/Wh to also allow EUR/J [warning]
- [ ] check fixed and variable maintenance to also be allowed. [warning]
- [ ] check number of assets in the ESDL. [warning]
- [ ] check if area contains atleast one asset [warning]
- [x] check if multiplier of profile is not 0 [error] !!
- [x] check name of carriers, return carrier = supplycarrier name + '_ret' [error] !!
- [ ] check carrier on all ports of joint are the same [error] !!
- [ ] improve error/warning messages
    - [ ] change asset id to asset name to be used in description
    - [ ] improve description of what to changes for errors:
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
- [ ] Add type filter to get function, for instance to be able to select SingleValue of type marginalCosts, Subselect
  with filter on all assets is now needed (schema_test_2.json)
- [ ] More select functions
- [ ] More check functions
- [ ] More interesting validation rules to test with
- [ ] Option to log to file instead of stdout
- [ ] Accept multiple types in get function so a check can be done on multiple entities but not the parent, for example
  GasHeater and HeatPump
- [ ] Versioning?
- [ ] More unit test (currently no test for api package)
- [ ] Endpoint for getting an overview of registered functions
- [ ] Simple frontend tool in a separate project
- [ ] Postman example file
- [ ] Tutorial

## Endpoints

Swagger documentation of the endpoints can be viewed by navigating to the root of the service. The services does not
contain authentication/authorization, this can be done within your own setup with something like traefik.

### schema

The schema endpoint can be used to manage the validation schemas. Validation schemas are used to validate an ESDL
document.

| Endpoints    | Operation | Description              |
|--------------|:----------|:-------------------------|
| /schema      | GET       | Get a summary of schemas |
| /schema      | POST      | Post a new schema        |
| /schema/{id} | GET       | Get a schema by id       |
| /schema/{id} | PUT       | Update a schema by id    |
| /schema/{id} | DELETE    | Delete a schema by id    |

### validation

validation endpoint expects multipart/form-data since we want to send an ESDL file with extra request parameters such as
schema id's, posting json with the ESDL as base64 string will have too much overhead with larger ESDL files.

| Endpoints   | Operation | Description                            |
|-------------|:----------|:---------------------------------------|
| /validation | POST      | Validate an ESDL against given schemas |

### Settings

esdl-validator can be configured using the following environment variables.

| Variable                      | Description                                              | default                       |
|-------------------------------|:---------------------------------------------------------|:------------------------------|
| ESDLVALIDATOR_TITLE           | Title of the service, shown in swagger                   | ESDL-Validator                |
| ESDLVALIDATOR_DESCRIPTION     | Description of the service, shown in swagger             | API for validating ESDL files |
| ESDLVALIDATOR_ENDPOINT_PREFIX | Prefix of the endpoint, for example /api                 | -                             |
| ESDLVALIDATOR_DEFAULT_CORS    | Enable the default CORS, accepting everything            | False                         |
| ESDLVALIDATOR_LOG_LEVEL       | Set the log level: CRITICAL, ERROR, WARNING, INFO, DEBUG | INFO                          |
| MONGODB_HOST                  | Host of MongoDB repository                               | localhost                     | 
| MONGODB_PORT                  | Port of MongoDB repository                               | 27017                         | 

## validation schema

ToDo: information on how a validatio schema is constructed

## Local development

We use [uv](https://docs.astral.sh/uv/) as a project and package manager. To develop locally. First make sure uv is installed.

Install uv

```bash
# On Linux.
curl -LsSf https://astral.sh/uv/install.sh | sh
```

```powershell
# On Windows.
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

Create a virtual environment if it is not set up yet. Run the command at the project root. This should create a virtual environment `.venv`

```
uv venv
```

To activate the virtual environment.

```bash
# On Linux.
source .venv/Scripts/activate
```

```powershell
# On Windows.
.venv\Scripts\activate
```


Project dependencies are specified in `pyproject.toml` and `uv.lock` files. To install dependencies, run the command below.

```
uv sync
```

To check the installed dependencies.

```
uv pip list
```

To add or remove a dependency, run the command below. This will update `pyproject.toml` and `uv.lock` automatically.

```
uv add {dependency to be installed}
uv remove {dependency to be removed}
```

#### Update pyESDL version

To work with the latest version of ESDL, make sure `pyESDL>={version}` in `pyproject.toml` is updated and run `uv sync` again.

### Run ESDL-validator in develop/debug mode

ESDL Validator uses MongoDB to store schema information. Therefore, make sure there is a MongoDB instance can be connected with. The host and port of MongoDB service can be configured via environment variables `MONGODB_HOST` and `MONGODB_PORT`. The easy way to start is to use `docker-compose.yml` file to start both containers. See the [Docker](#docker) section below.

Alternatively, to run ESDL Validator in a debug mode.

```
uv run app.py
```

### Run ESDL-validator using waitress

An example how to start the service using waitress.

```
uv run waitress-serve --listen="*:8080" --call "esdlvalidator.api.manage:create_app"
```

### Docker

To start ESDL Validator together with MongoDB using docker compose:

```
docker-compose -f docker-compose.yml up --build -d
```

The service should now be accesible on ```localhost:3011```

### Testing

To run test.

```
pytest
```

### Black format

The black format settings can be found under `[tool.black]` in the `pyproject.toml` file. To run black to format code.

```
black .
```

### Set up Git hooks

The `pre-push` git hook should be installed to avoid **project-specific** validation functions (which should be defined and stored under `esdlvalidator/validation/functions/projects/`) from being pushed to an open GitHub repository. 

This does not affect when pushing changes to the internal gitlab repository (both project-specific or generic functions can be pushed to remotes).

At the project root, run the command in a bash terminal to set up git hooks.

```bash
./.githooks/.setup-hooks.sh
```

You should see the logs below after the successful setup. 

```
Setting up Git hooks...
✅ Git hook installed: .git/hooks/pre-push
```

#### Examples

When pushing to the internal gitlab repository with `git push`, you would see message like below and then proceed.

```
Pre-push hook triggered for remote https://ci.tno.nl/gitlab/warmingup/chess-preprocessor.git
...
```

When pushing to the open GitHub repository with `git push`, and if there are any files and changes made under `esdlvalidator/validation/functions/projects/`, the push action is aborted with the following message.

```
Pre-push hook triggered for remote https://github.com/ESDLMapEditorESSIM/ESDLValidator.git
Pushing to GitHub. Checking files under esdlvalidator/validation/functions/projects/ ...
❌ Push to GitHub rejected! The following files are in the blocked 'esdlvalidator/validation/functions/projects/' directory:
esdlvalidator/validation/functions/projects/nwn/test.py
➡️ These files must not be pushed to GitHub. Push to GitLab is allowed.
```


## Validation

ToDo

### Functions

There are 2 types of functions: select and check. Select functions are used to generate a 'dataset' which can be used in
a check functions. In one validation schema multiple selects can be defined to select data from the esdl, filter out
data or generate new data such for example calculating an average. Check functions test every entry in the given dataset
and return a result (for every entry) which will be returned by the service, check function can generate warnings or
errors based on how the check is configured in the validation schema. New functions can be added easily, by
adding ```@FunctionFactory.register``` to the class, giving it a name and extending the appropriate function type the
function will be discovered automatically by the FunctionFactory. To use a function simply reference the function by
it's name in the validation schema i.e ```"function": "not_null"```

#### Select

ToDo: Instructions on the select function and how to add new ones

#### Check

ToDo: Instructions on the check function and how to add new ones
