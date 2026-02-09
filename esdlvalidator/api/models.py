from enum import Enum

from flask_restx import fields
from esdlvalidator.api import app
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionType

class ValidationType(Enum):
    WARNING = "warning"
    ERROR = "error"

registered_check_funcs = [func_name for func_name in FunctionFactory.get_registry(FunctionType.CHECK)]
registered_select_funcs = [func_name for func_name in FunctionFactory.get_registry(FunctionType.SELECT)]

schema_summary = app.api.model('SchemaSummary', {
    "id": fields.String(required=False, description="ID of the schema"),
    "name": fields.String(required=False, description="Name of the schema"),
    "description": fields.String(required=False, description="Description of the schema")
})

schema_validation_select = app.api.model("select", {
    "function": fields.String(required=True, description="Name of the registered select function to use", enum=registered_select_funcs, example="get"),
    "alias": fields.String(required=True, description="Alias for the dataset", example="areas"),
    "args": fields.Raw(required=True, description="Arguments passed to the select function", example={"type": "Area"}),
})

schema_validation_check = app.api.model("check", {
    "function": fields.String(required=True, description="Name of the registered check function to run", enum=registered_check_funcs, example="not_null"),
    "dataset": fields.String(required=True, description="Dataset to check on, use an alias from the selects", example="areas"),
    "args": fields.Raw(required=True, description="Arguments passed to the check function", example={"property": "scope", "counts_as_null": ["null"]}),
})

schema_validation = app.api.model("validation", {
    "name": fields.String(required=True, description="Name of the validation", example="check_area_scope_notnull"),
    "description": fields.String(required=True, description="Description of the validation", example="Check if all Areas have a scope"),
    "type": fields.String(required=True, description="Type warning or error", enum=[e.value for e in ValidationType], example=ValidationType.ERROR.value),
    "message": fields.String(required=True, description="Message to display on warning or error", example="Area does not have a scope"),
    "selects": fields.List(fields.Nested(schema_validation_select), required=True, desctiption="List of selects"),
    "check": fields.Nested(schema_validation_check, required=True, desctiption="Dict of check")
})

schema = app.api.model("schema", {
    "id": fields.String(required=False, description="ID of the validation schema", example="6027a402e658599189817ba2"),
    "name": fields.String(required=True, description="Name of the validation schema", example="My validation schema"),
    "description": fields.String(required=True, description="Description of the validation schema", example='The is a user defined validation schema'),
    "pre_validation_schemas": fields.List(fields.String, required=False, description="An optional list of schema IDs or names to run before this schema", example=["Schema A"]),
    "post_validation_schemas": fields.List(fields.String, required=False, description="An optional list of schema IDs or names to run after this schema", example=["Schema C"]),
    "validations": fields.List(fields.Nested(schema_validation), required=True, description="List of validations")
})
