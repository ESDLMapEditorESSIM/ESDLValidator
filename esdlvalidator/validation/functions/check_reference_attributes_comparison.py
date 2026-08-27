import jsonschema
from jsonschema.exceptions import ValidationError

from esdlvalidator.core.esdl import utils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import (
    FunctionFactory,
    FunctionCheck,
    FunctionDefinition,
    ArgDefinition,
    FunctionType,
    CheckResult,
)

from pyecore.ecore import EOrderedSet


@FunctionFactory.register(FunctionType.CHECK, "compare_reference_attributes")
class CompareRefAttributes(FunctionCheck):
    """
    Compares two attributes from either the input entity or its nested references.

    Supported operators:
    - greater_than
    - less_than
    - equal

    Each side (left/right) may specify a reference path and filter to locate the target entity.
    """

    def get_function_definition(self):
        return FunctionDefinition(
            "compare_reference_attributes",
            "Compare two attributes from the located references (or from the entity itself) using a specified operator.",
            [
                ArgDefinition(
                    "left",
                    "Reference and attribute to compare on the left side.",
                    True,
                ),
                ArgDefinition(
                    "operator",
                    "Comparison operator",
                    True,
                ),
                ArgDefinition(
                    "right",
                    "Reference and attribute to compare on the right side",
                    True,
                ),
                ArgDefinition("resultMsgJSON", "If True, returns results in structured JSON format.", False),
            ],
        )

    NOT_FOUND = "Not found"
    UNSET = "Unset"
    # Supported operator types. Can be extended in future if required.
    OPERATOR_ENUM = ["greater_than", "equal", "less_than"]

    args_schema = {
        "type": "object",
        "required": ["left", "operator", "right"],
        "properties": {
            "left": {"$ref": "#/$defs/refAttribute"},
            "operator": {"type": "string", "enum": OPERATOR_ENUM},
            "right": {"$ref": "#/$defs/refAttribute"},
            "resultMsgJSON": {"type": "boolean"},
        },
        "$defs": {
            "refAttribute": {
                "type": "object",
                "required": ["attribute"],
                "properties": {
                    # If ref is not specified, it refers to the input entity.
                    "ref": {
                        "type": "object",
                        "description": "Optional reference filter to locate neseted reference entity.",
                        "required": ["path"],
                        "properties": {
                            "path": {
                                "type": "string",
                                "description": "Dot-separated reference path (e.g., costInformation.investmentCosts)",
                            },
                            # To locate the target reference entity when reference is of EOrderedSet type (e.g., port).
                            "ref_list_filter": {
                                "type": "object",
                                "required": ["is_type"],
                                "properties": {
                                    "is_type": {"type": "string"},
                                    "match": {
                                        "type": "object",
                                        "description": "Optional attribute filters",
                                    },
                                },
                                "additionalProperties": False,
                            },
                        },
                        "additionalProperties": False,
                    },
                    "attribute": {
                        "type": "string",
                        "description": "Attribute name to extract from the (nested reference) entity",
                    },
                },
                "additionalProperties": False,
            }
        },
    }

    def execute(self):
        entity = self.value
        args_dict = self.args
        results = []

        try:
            jsonschema.validate(instance=args_dict, schema=self.args_schema)
        except ValidationError as e:
            raise ValueError(f"Schema validation failed at {list(e.path)}: {e.message}")

        operator = utils.get_attribute(self.args, "operator")
        left_args = utils.get_attribute(self.args, "left")
        right_args = utils.get_attribute(self.args, "right")
        resultMsgJSON = utils.get_attribute(self.args, "resultMsgJSON")

        left_entity = self._resolve_reference(entity, left_args.get("ref"), results)
        right_entity = self._resolve_reference(entity, right_args.get("ref"), results)

        left_val = self._get_attribute_value(left_entity, left_args, results) if left_entity else None
        right_val = self._get_attribute_value(right_entity, right_args, results) if right_entity else None

        if left_val is not None and right_val is not None:
            results.extend(self._compare_values(left_val, right_val, operator, left_args, right_args))

        if results:
            msg = (
                {"offending_asset": utils.get_attribute(entity, "id"), "message": results} if resultMsgJSON else results
            )
            return CheckResult(False, msg)
        return CheckResult(True)

    def _resolve_reference(self, entity: object, ref: dict, results: list):
        """Resolves the target entity from a reference path and optional filter."""

        if not ref:
            return entity

        ref_path = ref["path"]
        reference = utils.get_attr_or_ref_attr(entity, ref_path)

        if reference == self.NOT_FOUND:
            raise ValueError(f"[{ref_path}] not found.")
        if reference == self.UNSET:
            results.append(f"[{ref_path}] should be defined, but is unset.")
            return None

        if isinstance(reference, EOrderedSet):
            if len(reference) > 1 and ref.get("ref_list_filter"):
                # NOTE: Only the first matching entity is returned.
                entity_to_check = utils.get_ref(reference, ref["ref_list_filter"])
            else:
                entity_to_check = reference[0]

            if entity_to_check is None:
                match_str = ", ".join(f"[{k}] = '{v}'" for k, v in ref["ref_list_filter"].get("match", {}).items())
                results.append(
                    f"[{ref_path}] should contain a [{ref['ref_list_filter']['is_type']}] ({match_str}), but not found."
                )
            return entity_to_check

        return reference

    def _get_attribute_value(self, entity: object, attr_args: dict, results: list):
        """Retrieves the attribute value from the given entity and logs unset or missing cases."""

        attr_path = attr_args["attribute"]
        value = utils.get_attr_or_ref_attr(entity, attr_path)

        if value == self.NOT_FOUND:
            raise ValueError(f"{self._format_attr_context(attr_args)} not found.")
        if value == self.UNSET:
            results.append(f"{self._format_attr_context(attr_args)} should be defined, but is unset.")
            return None
        return value

    def _format_attr_context(self, attr_args: dict):
        """Generates a context-aware label for an attribute used in error messages."""

        attr = attr_args["attribute"]
        ref = attr_args.get("ref")

        if not ref:
            return f"[{attr}]"

        ref_type = ref.get("ref_list_filter", {}).get("is_type")
        match = ref.get("ref_list_filter", {}).get("match", {})

        match_str = ""
        if match:
            match_str = " with " + ", ".join(f"[{k}] = '{v}'" for k, v in match.items())

        return f"[{attr}] from [{ref_type}]{match_str}"

    def _compare_values(self, left_val, right_val, operator, left_args, right_args):
        """Compares two numeric values using the specified operator and returns result messages."""

        results = []
        try:
            left_num = float(left_val)
            right_num = float(right_val)
        except (TypeError, ValueError):
            results.append(f"Cannot compare non-numeric values: left='{left_val}', right='{right_val}'")
            return results

        left_desc = self._format_side_description(left_args, left_num)
        right_desc = self._format_side_description(right_args, right_num)

        if operator == "greater_than" and left_num <= right_num:
            results.append(f"{left_desc} should be greater than {right_desc}.")
        elif operator == "less_than" and left_num >= right_num:
            results.append(f"{left_desc} should be less than {right_desc}.")
        elif operator == "equal" and left_num != right_num:
            results.append(f"{left_desc} should be equal to {right_desc}.")
        return results

    def _format_side_description(self, attr_args: dict, value: float):
        """Formats a descriptive string for an attribute value based on its reference context."""

        attr = attr_args["attribute"]
        ref = attr_args.get("ref")

        if not ref:
            return f"[{attr}] (value: {value})"

        ref_type = ref.get("ref_list_filter", {}).get("is_type")
        match = ref.get("ref_list_filter", {}).get("match", {})

        match_str = ""
        if match:
            match_str = " with " + ", ".join(f"[{k}] = '{v}'" for k, v in match.items())

        return f"[{attr}] (value: {value}) from [{ref_type}]{match_str}"
