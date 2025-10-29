import jsonschema
from jsonschema.exceptions import ValidationError

from esdlvalidator.core.esdl import utils as esdlUtils

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

# TODO: check ports are connected to 1 hydraulically coupled network 

@FunctionFactory.register(FunctionType.CHECK, "compare_reference_attributes")
class CompareRefAttributes(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "compare_reference_attributes",
            "TODO",
            [
                ArgDefinition(
                    "ref",
                    "TODO",
                    True,
                ),
                ArgDefinition(
                    "operator",
                    "TODO",
                    True,
                ),
                ArgDefinition(
                    "left",
                    "TODO",
                    True,
                ),
                ArgDefinition(
                    "right",
                    "TODO",
                    True,
                ),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False),
            ],
        )

    # Supported operator types. Can be extended in future if required.
    OPERATOR_ENUM = ["greater_than", "equal", "less_than"]

    args_schema = {
        "type": "object",
        "required": ["ref", "operator", "left", "right"],
        "properties": {
            "ref": {"type": "string"},
            "operator": {"type": "string", "enum": OPERATOR_ENUM},
            "left": {
                "type": "object",
                "required": ["ref_filter", "attribute"],
                "properties": {
                    "ref_filter": {
                        "type": "object",
                        "required": ["is_type", "match"],
                        "properties": {"is_type": {"type": "string"}, "match": {"type": "object"}},
                    },
                    "attribute": {"type": "string"},
                },
            },
            "right": {
                "type": "object",
                "required": ["ref_filter", "attribute"],
                "properties": {
                    "ref_filter": {
                        "type": "object",
                        "required": ["is_type", "match"],
                        "properties": {"is_type": {"type": "string"}, "match": {"type": "object"}},
                    },
                    "attribute": {"type": "string"},
                },
            },
            "resultMsgJSON": {"type": "boolean"},
        },
    }

    NOT_FOUND = "Not found"
    UNSET = "Unset"

    def execute(self):
        entity = self.value
        args_dict = self.args

        results = []

        try:
            jsonschema.validate(instance=args_dict, schema=self.args_schema)
        except ValidationError as e:
            raise ValueError(f"Schema validation failed at {list(e.path)}: {e.message}")

        ref = utils.get_attribute(self.args, "ref")
        operator = utils.get_attribute(self.args, "operator")
        # TODO: rename to ref_args?
        left = utils.get_attribute(self.args, "left")
        right = utils.get_attribute(self.args, "right")
        resultMsgJSON = utils.get_attribute(self.args, "resultMsgJSON")

        # Check if the retrieved asset references are valid
        references = utils.get_attr_or_ref_attr(entity, ref)
        if references == self.NOT_FOUND:
            raise ValueError(f"[{ref}] not found.")
        if references == self.UNSET:
            results.append(f"[{ref}] should be defined, but is unset.")
        elif not isinstance(references, EOrderedSet):
            raise TypeError(f"Expect [{ref}] to be of EOrderedSet type, found {type(references)}")
        else:
            left_entity = self.get_ref(references, left["ref_filter"])
            right_entity = self.get_ref(references, right["ref_filter"])

            for entity_ref, side_args in [(left_entity, left), (right_entity, right)]:
                if entity_ref is None:
                    match_str = ", ".join(f"[{k}] = '{v}'" for k, v in side_args["ref_filter"]["match"].items())
                    results.append(
                        f"[{ref}] should contain a [{side_args['ref_filter']['is_type']}] ({match_str}), but not found."
                    )

            if left_entity and right_entity:
                left_val = self.get_attribute_value(left_entity, left, results)
                right_val = self.get_attribute_value(right_entity, right, results)

                if left_val is not None and right_val is not None:
                    try:
                        left_num = float(left_val)
                        right_num = float(right_val)
                    except (TypeError, ValueError):
                        # TODO: message
                        results.append(f"Cannot compare non-numeric values: left='{left_val}', right='{right_val}'")
                    else:
                        if operator == "greater_than" and left_num <= right_num:
                            results.append(
                                f"[{left['attribute']}] (vale: {left_num}) of [{left['ref_filter']['is_type']}] should be greater than [{right['attribute']}] (value: {right_val}) of [{right['ref_filter']['is_type']}]."
                            )
                        elif operator == "less_than" and left_num >= right_num:
                            results.append(
                                f"[{left['attribute']}] (vale: {left_num}) of [{left['ref_filter']['is_type']}] should be less than [{right['attribute']}] (value: {right_val}) of [{right['ref_filter']['is_type']}]."
                            )
                        elif operator == "equal" and left_num != right_num:
                            results.append(
                                f"[{left['attribute']}] (vale: {left_num}) of [{left['ref_filter']['is_type']}] should be equal to [{right['attribute']}] (value: {right_val}) of [{right['ref_filter']['is_type']}]."
                            )

        if len(results) > 0:
            if resultMsgJSON:
                msg = {"offending_asset": utils.get_attribute(entity, "id"), "message": results}
                return CheckResult(False, msg)
            else:
                return CheckResult(False, results)
        else:
            return CheckResult(True)

    def get_ref(self, references: EOrderedSet, ref_filter: dict):
        """
        Filters a set of ESDL references to find the first entity matching the given type and attribute criteria.

        Args:
            references: A collection of ESDL entities.
            ref_filter: A dictionary with keys:
                - 'is_type': the expected ESDL type as a string.
                - 'match': a dictionary of attribute names and expected values.

        Returns:
            The first matching entity, or None if no match is found.
        """
        ref_type = ref_filter["is_type"]
        match_dict = ref_filter["match"]
        esdlType = esdlUtils.get_esdl_class_from_string(ref_type)[0]

        for entity in references:
            if not isinstance(entity, esdlType):
                continue
            if all(utils.get_attr_or_ref_attr(entity, key) == value for key, value in match_dict.items()):
                return entity

        return None

    def get_attribute_value(self, entity, args: dict, results):
        filter = args["ref_filter"]
        attr_path = args["attribute"]
        value = utils.get_attr_or_ref_attr(entity, attr_path)

        if value == self.NOT_FOUND:
            raise ValueError(f"[{attr_path}] not found.")
        if value == self.UNSET:
            # TODO: rename variable
            # msg_head = f"[{attr_path}]"

            match_str = ", ".join(f"{k}={v}" for k, v in filter["match"].items())
            msg_head = f"[{filter['is_type']}] ({match_str})"
            # if len(attr_path.split(".")) > 1:
            #     parent_path = attr_path.split(".")[-2]
            #     parent_value = utils.get_attr_or_ref_attr(entity, parent_path)
            #     if parent_path and parent_value.name:
            #         msg_head = f"[{attr_path.split('.')[-1]}] of [{parent_path}] ({parent_value.name})"
            results.append(f"{msg_head} should have [{attr_path}] defined, but is unset.")
            return None
        return value
