# ESDL Validator

A REST service for validating [Energy System Description Language](https://energytransition.gitbook.io/esdl/) (ESDL) files against user-defined validation schemas.

ESDL Validator allows you to define flexible validation rules (schemas) and run them against ESDL files via a REST API. It is designed to be extensible — new validation functions can be added easily using a plugin-based architecture.

## Quick Start

Start the service with Docker Compose:

```bash
docker-compose up -d
```

This pulls the [published image](https://hub.docker.com/r/esdlmapeditoressim/esdlvalidator) and starts the service with a MongoDB instance. The service will be available at `http://localhost:3011`. Navigate to the root URL to see the Swagger documentation.

### Basic workflow

1. **Upload a validation schema** — `POST /schema` with a JSON schema definition (see [Validation Schema](#validation-schema) below).
2. **List available schemas** — `GET /schema` returns a summary of all uploaded schemas.
3. **Run a validation** — `POST /validationToMessages` with an ESDL string and one or more schema IDs/names.

## Endpoints

Swagger documentation is auto-generated and can be viewed by navigating to the root of the service. Note that the service does not include authentication/authorization, but can be handled in your own setup.

### Schema

Manage validation schemas stored in the database.

| Endpoint              | Method | Description                                                     |
|-----------------------|--------|-----------------------------------------------------------------|
| `/schema`             | GET    | Get a summary of schemas. Supports optional `id` and `name` query params for filtering. |
| `/schema`             | POST   | Upload a new validation schema                                  |
| `/schema/{id_or_name}`| GET    | Get a schema by ID or name                                      |
| `/schema/{id_or_name}`| PUT    | Update a schema by ID                                           |
| `/schema/{id_or_name}`| DELETE | Delete a schema by ID                                           |

### Validation

Run validations and get results grouped per asset.

| Endpoint                 | Method | Description                                                                 |
|--------------------------|--------|-----------------------------------------------------------------------------|
| `/validationToMessages`  | POST   | Validate an ESDL against one or more schemas. Returns messages grouped by asset ID. |

**Request parameters:**

- `data` — ESDL file content as a string
- `schemas` — Comma-separated list of schema IDs or names

**Example response:**

```json
[
  {
    "assetID": "6f45c6f8-e8e2-4378-a910-45140337b9dd",
    "messages": [
      {
        "severity": "ERROR",
        "validation_message": "Required attribute not set or invalid",
        "check_result_messages": ["[power] should satisfy > 0.0, but found [0.0]."]
      }
    ]
  }
]
```

## Validation Schema

A validation schema defines a set of rules to validate an ESDL file. It consists of a name, description, and a list of validations.

```json
{
  "name": "My validation schema",
  "description": "Schema to validate heat network assets",
  "pre_validation_schemas": ["General checks"],
  "post_validation_schemas": [],
  "validations": [...]
}
```

| Field                      | Required | Description                                                      |
|----------------------------|----------|------------------------------------------------------------------|
| `name`                     | Yes      | Name of the schema (must be unique)                              |
| `description`              | Yes      | Description of the schema                                        |
| `pre_validation_schemas`   | No       | List of schema IDs or names to run **before** this schema        |
| `post_validation_schemas`  | No       | List of schema IDs or names to run **after** this schema         |
| `validations`              | Yes      | List of validation rules                                         |

### Validation rule

Each validation contains a name, description, severity type, a message, select functions, and a check function.

```json
{
  "name": "heatpump_required_attributes_are_set",
  "description": "Report errors if the required attributes of HeatPump are not set.",
  "type": "error",
  "message": "Required attribute not set or invalid",
  "selects": [
    {
      "function": "get",
      "alias": "heatpumps",
      "args": {
        "type": ["HeatPump"]
      }
    }
  ],
  "check": {
    "function": "attributes_validation",
    "dataset": "heatpumps",
    "args": {
      "null_checks": [
        { "attribute": "name", "count_as_null": [""] },
        { "attribute": "COP", "count_as_null": [0.0] }
      ],
      "valid_checks": [
        {
          "attribute": "power",
          "in_range": { "min_exclusive": 0.0 }
        }
      ],
      "resultMsgJSON": true
    }
  }
}
```

| Field         | Required | Description                                                              |
|---------------|----------|--------------------------------------------------------------------------|
| `name`        | Yes      | Name of the validation rule                                              |
| `description` | Yes      | Description of the validation rule                                       |
| `type`        | Yes      | Severity: `"error"` or `"warning"`                                       |
| `message`     | Yes      | Message prefix for generated results                                     |
| `selects`     | Yes      | List of select functions to generate datasets                            |
| `check`       | Yes      | Check function to run against the selected dataset                       |

## Functions

There are two types of functions: **select** and **check**.

- **Select functions** generate a dataset from the ESDL. Multiple selects can be chained — each subsequent select can use the results of previous ones.
- **Check functions** test every entity in a dataset and return pass/fail results. Failed checks produce warnings or errors based on the validation's `type` field.

Functions are auto-discovered at startup. To reference a function in a schema, use its registered name (e.g., `"function": "get"`).

### Example select function: `get`

Select all HeatPump assets with a filter on port count:

```json
{
  "function": "get",
  "alias": "heatpumps",
  "args": {
    "type": ["HeatPump"],
    "filter": [
      { "attribute": "port", "count": { "min": 4, "max": 4 } }
    ]
  }
}
```

### Example check function: `attributes_validation`

This is the most commonly used check function. It supports null checks and validity/range checks on entity attributes or nested references.

```json
{
  "function": "attributes_validation",
  "dataset": "assets",
  "args": {
    "null_checks": [
      { "attribute": "name", "count_as_null": [""] }
    ],
    "valid_checks": [
      {
        "attribute": "efficiency",
        "in_range": { "min_exclusive": 0.0, "max": 1.0 }
      },
      {
        "attribute": "power",
        "in_range": { "min_exclusive": 0.0 }
      }
    ],
    "resultMsgJSON": true
  }
}
```

It also supports checking attributes on nested references via the optional `ref` argument:

```json
{
  "function": "attributes_validation",
  "dataset": "assets",
  "args": {
    "ref": { 
      "path": "costInformation.investmentCosts.profileQuantityAndUnit" 
    },
    "null_checks": [],
    "valid_checks": [
        { "attribute": "unit", "count_as_valid": "EURO" },
        { "attribute": "perUnit", "count_as_valid": "WATT" },
        { "attribute": "perMultiplier", "count_as_valid": ["MEGA", "KILO"] },
        { "attribute": "perTimeUnit", "count_as_valid": "Unset" }
    ],
    "resultMsgJSON": true
  }
}
```

### Example check function: `compare_reference_attributes`

Used to compare attribute values between two reference paths on the same entity. For example, validating temperature relationships between ports.

```json
{
  "function": "compare_reference_attributes",
  "dataset": "assets",
  "args": {
    "left": {
      "ref": {
        "path": "port",
        "ref_list_filter": { "is_type": "OutPort", "match": { "name": "Out" } }
      },
      "attribute": "carrier.supplyTemperature"
    },
    "operator": "greater_than",
    "right": {
      "ref": {
        "path": "port",
        "ref_list_filter": { "is_type": "InPort", "match": { "name": "In" } }
      },
      "attribute": "carrier.returnTemperature"
    },
    "resultMsgJSON": true
  }
}
```

Supported operators: `greater_than`, `less_than`, `equal`.

<!-- ### And / Or logic

Checks can be composed with `and` and `or` clauses for complex conditional validations. Sub-checks are evaluated recursively on the same entity and can themselves contain nested `and`/`or`.

**Evaluation logic:**

1. Run the **main check**.
2. If main passes, run all **AND** checks. If all AND checks also pass → **entity passes**.
3. If main or any AND check fails, run **OR** checks. If any OR check passes → **entity passes** (rescued by OR).
4. If nothing passes → **entity fails**. All failed results (main, AND, OR) are reported.

In short: `(main AND all_and) OR any_or`.

#### Example: AND only

Check that a producer has exactly 2 ports AND the supply temperature on OutPort is greater than the return temperature on InPort:

```json
"check": {
  "function": "reference_count_in_range",
  "dataset": "assets",
  "args": {
    "referenceType": "port",
    "min": 2,
    "max": 2,
    "resultMsgJSON": true
  },
  "and": [
    {
      "function": "compare_reference_attributes",
      "args": {
        "left": {
          "ref": {
            "path": "port",
            "ref_list_filter": { "is_type": "OutPort", "match": { "name": "Out" } }
          },
          "attribute": "carrier.supplyTemperature"
        },
        "operator": "greater_than",
        "right": {
          "ref": {
            "path": "port",
            "ref_list_filter": { "is_type": "InPort", "match": { "name": "In" } }
          },
          "attribute": "carrier.returnTemperature"
        },
        "resultMsgJSON": true
      }
    }
  ]
}
```

#### Example: AND + OR

Check that an asset has `power` set AND `marginalCosts` defined, OR has a `profile` on its port:

```json
"check": {
  "function": "attributes_validation",
  "dataset": "producers",
  "args": {
    "null_checks": [
      { "attribute": "power", "count_as_null": [0.0] }
    ],
    "valid_checks": []
  },
  "and": [
    {
      "function": "attributes_validation",
      "args": {
        "null_checks": [
          { "attribute": "costInformation.marginalCosts.value", "count_as_null": [0.0] }
        ],
        "valid_checks": []
      }
    }
  ],
  "or": [
    {
      "function": "attributes_validation",
      "args": {
        "null_checks": [
          { "attribute": "port.profile", "count_as_null": [] }
        ],
        "valid_checks": []
      }
    }
  ]
}
```

> **Known issue:** when `(main AND all_and)` passes but an `or` list is also present and all OR checks fail, the current implementation incorrectly reports the OR failures instead of returning success. A fix is tracked in the TODO below. -->

### Complete schema example

For a full real-world example, see [`testdata/schemas/schema_NWN_general.json`](testdata/schemas/schema_NWN_general.json) which validates a heat network topology including asset types, port configurations, carrier temperatures, and attribute requirements.

## Adding Custom Functions

New functions can be added by creating a Python file in `esdlvalidator/validation/functions/`. The function will be auto-discovered at startup.

### Adding a new check function

1. Create a file in `esdlvalidator/validation/functions/`, e.g. `check_my_custom.py`
2. Register the function with the `@FunctionFactory.register` decorator
3. Inherit from `FunctionCheck` and implement `execute()`

```python
from esdlvalidator.validation.functions.function import (
    FunctionFactory, FunctionCheck, FunctionDefinition,
    ArgDefinition, FunctionType, CheckResult,
)
from esdlvalidator.validation.functions import utils


@FunctionFactory.register(FunctionType.CHECK, "my_custom_check")
class MyCustomCheck(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "my_custom_check",
            "Description of what this check does",
            [ArgDefinition("my_arg", "Description of the argument", True)],
        )

    def execute(self):
        entity = self.value          # The current entity being checked
        my_arg = self.args["my_arg"] # Arguments from the schema

        # Your validation logic here
        if some_condition_fails:
            return CheckResult(False, "Error message")

        return CheckResult(True)
```

### Adding a new select function

Same pattern, but inherit from `FunctionSelect` and register with `FunctionType.SELECT`:

```python
from esdlvalidator.validation.functions.function import (
    FunctionFactory, FunctionSelect, FunctionDefinition,
    ArgDefinition, FunctionType,
)


@FunctionFactory.register(FunctionType.SELECT, "my_custom_select")
class MyCustomSelect(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "my_custom_select",
            "Description of what this select does",
            [ArgDefinition("my_arg", "Description of the argument", True)],
        )

    def execute(self):
        dataset = self.datasets.get("resource")
        # Your selection logic here
        return selected_entities
```

Once added, reference the function by name in any validation schema: `"function": "my_custom_check"`.

## Local Development

### Prerequisites

- Python >= 3.10
- [uv](https://docs.astral.sh/uv/) — project and package manager
- MongoDB instance (for schema storage)

### Install uv

```bash
# Linux
curl -LsSf https://astral.sh/uv/install.sh | sh
```

```powershell
# Windows
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### Setup

```bash
uv sync
```

This installs all dependencies and automatically creates a `.venv` if one doesn't exist.

Copy `.env.template` to `.env` and adjust values as needed:

```bash
cp .env.template .env
```

### Managing dependencies

```bash
uv add <package>       # Add a dependency
uv remove <package>    # Remove a dependency
uv pip list            # Check installed packages
```

### Updating pyESDL

Update the `pyesdl` version constraint in `pyproject.toml` and run `uv sync`.

### Running in debug mode

ESDL Validator requires a MongoDB instance for schema storage. The host and port can be configured via `MONGODB_HOST` and `MONGODB_PORT` in `.env`.

```bash
uv run app.py
```

The service starts on `http://localhost:5000` by default.

### Running with waitress

```bash
uv run waitress-serve --listen="*:5000" --call "esdlvalidator.api.manage:create_app"
```

### Docker

To build and run from local source instead of the published image:

```bash
docker-compose up --build
```

To build the image separately:

```bash
docker build -t esdl-validator .
```

## Testing

```bash
uv run pytest
```

## Integration with ESDL MapEditor

For integrating ESDL Validator into the [ESDL MapEditor](https://github.com/ESDLMapEditorESSIM) toolsuite, see `docker-compose-toolsuite.yml` as a reference for connecting to the shared MapEditor network.

## TODOs

- [ ] Fix, update, and re-enable commented-out tests (`test_validator.py`)
- [ ] Improve test coverage for newer check functions (`compare_reference_attributes`, etc.)
- [ ] Clean up legacy schemas and select/check functions
<!-- - [ ] Fix And/Or logic bug: when `(main AND all_and)` passes but `or` list is present and all OR checks fail, failures are incorrectly reported (`validator.py`) -->
