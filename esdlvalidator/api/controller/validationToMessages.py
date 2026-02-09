import json
from typing import TypedDict, Optional

from flask import request, Response
from flask_restx import Resource

from esdlvalidator.api import app
from esdlvalidator.api.controller import validationService, schemaService
from esdlvalidator.core.exceptions import SchemaNotFound

parser = app.api.parser()
parser.add_argument("data", type=str, required=True)
parser.add_argument("schemas", type=str, help="List of schema id's, comma separated", required=True)


class ValidationResult(TypedDict):
    severity: str
    validation_message: str
    check_result_messages: list[str]


class AssetMessage(TypedDict):
    """AssetMessage messages contains a list of all ValidationResult that are associated with the assetID"""

    assetID: str
    messages: list[ValidationResult]


@app.ns_validation_to_msgs.route("/")
class ValidationToMessagesController(Resource):

    @app.ns_validation_to_msgs.doc(
        description="Post a new validation schema",
        responses={200: "Ok", 404: "Schema not found", 400: "Unknown filetype, Invalid ESDL"},
    )
    @app.api.expect(parser, validate=True)
    def post(self):
        """Validate an ESDL file and return grouped validation messages per asset"""

        if request.data:
            # 'Contains the incoming request data as string in case it came with a mimetype Flask does not handle'
            # > Happens with requests from the mapeditor
            file = request.data.decode("utf-8")
        else:
            # with openapi
            file = request.args["data"]

        if "schemas" not in request.args:
            return "Bad Request: Required 'schemas' parameter missing", 400

        # Main schema refs requested by user
        main_schema_refs = [id_or_name for id_or_name in request.args["schemas"].split(",")]

        try:
            main_schema_defs = schemaService.get_by_id_or_name(main_schema_refs)

            # Collect all schemas to run
            pre_refs = []
            post_refs = []
            for schema in main_schema_defs:
                pre_refs.extend(schema.get("pre_validation_schemas", []))
                post_refs.extend(schema.get("post_validation_schemas", []))

            # Remove duplicates while preserving order
            def unique(seq):
                return list(dict.fromkeys(seq))

            pre_refs = unique(pre_refs)
            post_refs = unique(post_refs)

            # Run validations in order
            results = []

            if pre_refs:
                pre_defs = schemaService.get_by_id_or_name(pre_refs)
                pre_ids = [schema["id"] for schema in pre_defs]
                results.append(validationService.validateContents(file, pre_ids))

            main_ids = [schema["id"] for schema in main_schema_defs]
            results.append(validationService.validateContents(file, main_ids))

            if post_refs:
                post_defs = schemaService.get_by_id_or_name(post_refs)
                post_ids = [schema["id"] for schema in post_defs]
                results.append(validationService.validateContents(file, post_ids))

        except SchemaNotFound as e:
            return e.message, e.statusCode

        json_result: list[AssetMessage] = []

        for result in results:
            for schema in result.get("schemas", []):
                if "validations" not in schema:
                    continue

                for validation in schema["validations"]:
                    for severity_key in ["errors", "warnings"]:
                        severity = severity_key.rstrip("s").upper()

                        if severity_key in validation:
                            for issue in validation[severity_key]:
                                # TODO: handle issue is a string
                                asset_id = issue.get("offending_asset")

                                if asset_id is None:
                                    raise KeyError(
                                        f"Can not associate message with an asset as 'offending_asset' key not found."
                                    )

                                message = issue.get("message")
                                if isinstance(message, dict):
                                    validation_msg = message.get("validation_message", "")
                                    check_msgs = message.get("check_result_message", [])
                                    if isinstance(check_msgs, str):
                                        check_msgs = [check_msgs]
                                else:
                                    validation_msg = ""
                                    check_msgs = [str(message)]

                                asset_message = self.get_asset_message(asset_id, json_result)

                                if asset_message is None:
                                    new_asset_message = AssetMessage(
                                        assetID=asset_id,
                                        messages=[
                                            ValidationResult(
                                                severity=severity,
                                                validation_message=validation_msg,
                                                check_result_messages=check_msgs,
                                            )
                                        ],
                                    )
                                    json_result.append(new_asset_message)

                                else:
                                    # Try to find existing validation_message entry and extend its check_result_messages
                                    matched = False
                                    for v_result in asset_message["messages"]:
                                        if v_result["validation_message"] == validation_msg:
                                            v_result["check_result_messages"].extend(check_msgs)
                                            matched = True
                                            break

                                    if not matched:
                                        asset_message["messages"].append(
                                            ValidationResult(
                                                severity=severity,
                                                validation_message=validation_msg,
                                                check_result_messages=check_msgs,
                                            )
                                        )

        return Response(response=json.dumps(json_result), status=200, mimetype="text/json")

    @staticmethod
    def get_asset_message(asset_id: str, assets_messages: list[AssetMessage]) -> Optional[AssetMessage]:
        """Find and return the AssetMessage for a given asset ID"""
        return next((m for m in assets_messages if m["assetID"] == asset_id), None)
