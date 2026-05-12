import jsonschema
from jsonschema.exceptions import ValidationError

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


@FunctionFactory.register(FunctionType.CHECK, "attributes_validation")
class AttributesValidation(FunctionCheck):
    """
    Validates attributes of an ESDL entity or its nested reference.

    This function performs two types of checks:
    1. Null checks: Ensures specified attributes are set and not equal to any value listed in `count_as_null`.
    2. Validity checks: Ensures specified attributes match expected values defined in `count_as_valid`.
    Only string values are supported for validity checks.

    Supports checking attributes directly on the entity or through a reference path, including filtered lists.
    """

    def get_function_definition(self):
        return FunctionDefinition(
            "attributes_validation",
            "Check attributes of an ESDL entity or its nested reference.",
            [
                ArgDefinition(
                    "ref",
                    "An optional dictionary specifying the reference path (Dot-separated string. For instance costInformation.investmentCosts), "
                    "an optional filter can be specified to locate the target reference entity when reference is of EOrderedSet type.",
                    False,
                ),
                ArgDefinition(
                    "null_checks",
                    "A list of dictionaries with keys:"
                    " - attribute: the attribute name to check"
                    " - count_as_null: list of values considered null (e.g., 0.0).",
                    True,
                ),
                ArgDefinition(
                    "valid_checks",
                    "A list of dictionaries with keys: "
                    " - attribute: the attribute name to validate"
                    " - count_as_valid: either a string or list of strings considered valid",
                    True,
                ),
                ArgDefinition("resultMsgJSON", "If True, returns results in structured JSON format.", False),
                ArgDefinition("resultMsgAtParentNode", "If True, attaches result to the parent entity's ID.", False),
            ],
        )

    NOT_FOUND = "Not found"
    UNSET = "Unset"

    args_schema = {
        "type": "object",
        "required": ["null_checks", "valid_checks"],
        "properties": {
            # If ref is not specified, it refers to the input entity.
            "ref": {
                "type": "object",
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
                            "is_type": {
                                "anyOf": [
                                    {"type": "string"},
                                    {
                                        "type": "array",
                                        "items": {"type": "string"}
                                    }
                                ]
                            },
                            "match": {
                                "type": "object",
                                "description": "Optional attribute filters",
                            },
                        },
                    },
                },
                "additionalProperties": False,
            },
            "null_checks": {
                "type": "array",
                "items": {"$ref": "#/$defs/nullCheckItem"},
            },
            "valid_checks": {
                "type": "array",
                "items": {"$ref": "#/$defs/validCheckItem"},
            },
            "resultMsgJSON": {"type": "boolean"},
            "resultMsgAtParentNode": {"type": "boolean"},
        },
        "additionalProperties": False,
        "$defs": {
            "nullCheckItem": {
                "type": "object",
                "required": ["attribute", "count_as_null"],
                "properties": {
                    "attribute": {"type": "string", "description": "Attribute name to check for null-like values"},
                    "count_as_null": {
                        "type": "array",
                        "items": {"anyOf": [{"type": "string"}, {"type": "number"}]},
                        "description": "Values considered null; can be empty",
                    },
                },
                "additionalProperties": False,
            },
            "validCheckItem": {
                "type": "object",
                "required": ["attribute"],
                "properties": {
                    "attribute": {"type": "string", "description": "Attribute name to validate"},
                    "count_as_valid": {"anyOf": [{"type": "string"}, {"type": "array", "items": {"type": "string"}}]},
                    "in_range": {
                        "type": "object",
                        "properties": {
                            "min": {"type": ["number", "null"]},
                            "max": {"type": ["number", "null"]},
                            "min_exclusive": { "type": ["number", "null"] },
                            "max_exclusive": { "type": ["number", "null"] }
                        }
                    }
                },
                "additionalProperties": False,
            },
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

        ref = utils.get_attribute(self.args, "ref")
        null_checks = utils.get_attribute(self.args, "null_checks")
        valid_checks = utils.get_attribute(self.args, "valid_checks")
        resultMsgJSON = utils.get_attribute(self.args, "resultMsgJSON")
        resultMsgAtParentNode = utils.get_attribute(self.args, "resultMsgAtParentNode")

        entity_to_check = self._resolve_reference(entity, ref, results)

        if entity_to_check:
            results.extend(self._run_null_checks(entity_to_check, null_checks))
            results.extend(self._run_valid_checks(entity_to_check, valid_checks))

        if results:
            target_id = (
                utils.get_attribute(entity.eContainer(), "id")
                if resultMsgAtParentNode
                else utils.get_attribute(entity, "id")
            )
            msg = {"offending_asset": target_id, "message": results} if resultMsgJSON else results
            return CheckResult(False, msg)

        return CheckResult(True)

    def _resolve_reference(self, entity: object, ref: dict, results: list):
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
            if len(reference) == 0:
                entity_to_check = None
            elif ref.get("ref_list_filter") is not None:
                # NOTE: Only the first matching entity is returned.
                entity_to_check = utils.get_ref(reference, ref["ref_list_filter"])
            else:
                entity_to_check = reference[0]

            if entity_to_check is None:
                match_str = ", ".join(f"[{k}] = '{v}'" for k, v in ref["ref_list_filter"].get("match", {}).items())
                match_str = f" ({match_str})" if match_str else ""
                
                ref_type = ref['ref_list_filter']['is_type']
                type_list = ref_type if isinstance(ref_type, list) else [ref_type]
                # Join with " or " for readability
                if len(type_list) == 1:
                    type_str = type_list[0]
                else:
                    type_str = " or ".join(type_list)
                
                results.append(
                    f"[{ref_path}] should contain a [{type_str}]{match_str}, but not found."
                )
            return entity_to_check

        return reference

    def _run_null_checks(self, entity: any, checks: list):
        results = []
        for check in checks:
            attr = check["attribute"]
            null_values = check["count_as_null"]
            value = utils.get_attr_or_ref_attr(entity, attr)

            if value == self.NOT_FOUND:
                raise ValueError(f"Attribute [{attr}] not found.")
            if value == self.UNSET:
                results.append(f"[{attr}] should be defined, but is unset.")
            else:
                for null_val in null_values:
                    if (isinstance(null_val, str) and str(null_val).lower() == str(value).lower()) or null_val == value:
                        results.append(f"[{attr}] value cannot be {null_val}.")
                        break
        return results

    def _run_valid_checks(self, entity: object, checks: list):
        results = []
        for check in checks:
            attr = check["attribute"]
            value = utils.get_attr_or_ref_attr(entity, attr)

            if value == self.NOT_FOUND:
                raise ValueError(f"Attribute [{attr}] not found.")
            
            # Valid values check
            valid_values = check.get("count_as_valid")
            if valid_values:
                valid_list = valid_values if isinstance(valid_values, list) else [valid_values]

                if value == self.UNSET:
                    if self.UNSET not in valid_list:
                        results.append(
                            f"[{attr}] should be {'one of ' if len(valid_list) > 1 else ''}[{', '.join(valid_list)}], but is unset."
                        )
                else:
                    value_str = getattr(value, "name", str(value)).lower()
                    if value_str not in [v.lower() for v in valid_list]:
                        results.append(
                            f"[{attr}] should be {'one of ' if len(valid_list) > 1 else ''}[{', '.join(valid_list)}], but found [{value_str}]."
                        )

            # Range check; Also support lower bound and upper bound only check
            in_range = check.get("in_range")
            if in_range:
                min_val = in_range.get("min")
                max_val = in_range.get("max")
                min_ex = in_range.get("min_exclusive")
                max_ex = in_range.get("max_exclusive")

                parts = []
                if min_val is not None:
                    parts.append(f">= {min_val}")
                if min_ex is not None:
                    parts.append(f"> {min_ex}")
                if max_val is not None:
                    parts.append(f"<= {max_val}")
                if max_ex is not None:
                    parts.append(f"< {max_ex}")

                range_desc = " and ".join(parts) if parts else "no constraints"

                if value == self.UNSET:
                    results.append(
                        f"[{attr}] should satisfy {range_desc}, but is unset."
                    )
                    continue

                violation = False
                if min_val is not None and value < min_val:
                    violation = True
                if min_ex is not None and value <= min_ex:
                    violation = True
                if max_val is not None and value > max_val:
                    violation = True
                if max_ex is not None and value >= max_ex:
                    violation = True

                if violation:
                    results.append(
                        f"[{attr}] should satisfy {range_desc}, but found [{value}]."
                    )

        return results
