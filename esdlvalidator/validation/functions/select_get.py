import jsonschema
from jsonschema.exceptions import ValidationError

from pyecore.ecore import EOrderedSet

from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.SELECT, "get")
class SelectGet(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "get",
            "Get a list of entities of the specified type(s) from the input ESDL. "
            "Optionally, specifying `exlcude_type` to filter out certain type(s). "
            "If a `property` argument is specified, the corresponding property values will be extracted from the queried entities and returned in the datasets. "
            "If a `filter` argument is specified, only entities matching all conditions are returned.",
            [
                ArgDefinition("type", "A (list of) type name of entities to retrieve, this can be a superclass. i.e. Port returns InPort, OutPort...", True),
                ArgDefinition("exclude_type", "A (list of) type name of entities to exclude, this can be a superclass. i.e. Port returns InPort, OutPort...", False),
                ArgDefinition("property", "A (list of) property of entities to be extracted and be stored additionally in the returned datasets", False),
                ArgDefinition(
                    "filter",
                    "Optional list of attribute conditions to filter selected entities. "
                    "Each condition specifies an 'attribute' (dot-separated path) and one or both of: "
                    "'match' (case-insensitive string/enum equality, single value or list) and/or "
                    "'in_range' (numeric bounds: min, max, min_exclusive, max_exclusive). "
                    "All conditions are ANDed — an entity must satisfy every condition to be included.",
                    False,
                ),
            ]
        )

    args_schema = {
        "type": "object",
        "required": ["type"],
        "properties": {
            "type": {
                "anyOf": [
                    {"type": "string"},
                    {"type": "array", "items": {"type": "string"}},
                ]
            },
            "exclude_type": {
                "anyOf": [
                    {"type": "string"},
                    {"type": "array", "items": {"type": "string"}},
                ]
            },
            "property": {
                "anyOf": [
                    {"type": "string"},
                    {"type": "array", "items": {"type": "string"}},
                ]
            },
            "filter": {
                "type": "array",
                "items": {"$ref": "#/$defs/filterCondition"},
                "description": "All conditions are ANDed together.",
            },
        },
        "additionalProperties": False,
        "$defs": {
            "filterCondition": {
                "type": "object",
                "required": ["attribute"],
                "properties": {
                    "attribute": {
                        "type": "string",
                        "description": "attribute path, e.g. 'power' or 'state'",
                    },
                    "match": {
                        "anyOf": [
                            {"type": "string"},
                            {"type": "array", "items": {"type": "string"}},
                        ],
                        "description": "Case-insensitive string/enum equality. Entity is kept only if attribute matches any of the given values. "
                        "Include 'Unset' in the list to also match entities where the attribute was never explicitly set (e.g. an enum's implicit default).",
                    },
                    "contains": {
                        "anyOf": [
                            {"type": "string"},
                            {"type": "array", "items": {"type": "string"}},
                        ],
                        "description": "Case-insensitive substring check. Entity is kept only if the attribute value contains any of the given strings.",
                    },
                    "in_range": {
                        "type": "object",
                        "properties": {
                            "min":           {"type": ["number", "null"]},
                            "max":           {"type": ["number", "null"]},
                            "min_exclusive": {"type": ["number", "null"]},
                            "max_exclusive": {"type": ["number", "null"]},
                        },
                        "additionalProperties": False,
                    },
                    "count": {
                        "type": "object",
                        "properties": {
                            "min":           {"type": ["integer", "null"]},
                            "max":           {"type": ["integer", "null"]},
                            "min_exclusive": {"type": ["integer", "null"]},
                            "max_exclusive": {"type": ["integer", "null"]},
                        },
                        "additionalProperties": False,
                        "description": "Filter by the number of items in a collection reference (e.g. port). Use min/max with the same value to match an exact count.",
                    },
                },
                "additionalProperties": False,
            }
        },
    }

    NOT_FOUND = "Not found"
    UNSET = "Unset"

    def execute(self):
        try:
            jsonschema.validate(instance=self.args, schema=self.args_schema)
        except ValidationError as e:
            raise ValueError(f"Schema validation failed at {list(e.path)}: {e.message}")

        dataset = self.datasets.get("resource")

        types = self.args["type"]
        if isinstance(types, str):
            types = [types]

        excluded_esdlClasses = []
        if "exclude_type" in self.args:
            if isinstance(self.args["exclude_type"], (str, list)):
                excluded_esdlClasses = esdlUtils.get_esdl_class_from_string(self.args["exclude_type"])
            else:
                raise ValueError(f"Invalid function argument 'exclude_type' type. Expect str or list, got {type(self.args['exclude_type'])}")
        
        properties = []
        if "property" in self.args:
            if isinstance(self.args["property"], str):
                properties = [self.args["property"]]
            elif isinstance(self.args["property"], list):
                properties = self.args["property"]
            else:
                raise ValueError(f"Invalid function argument 'property' type. Expect str or list, got {type(self.args['property'])}")

        selected_entities = []
        for type_name in types:
            getType = utils.get_attribute({'type': type_name}, "type")
            entities = esdlUtils.get_entities_from_esdl_resource_by_type(dataset, getType)

            for entity in entities:
                if not any(isinstance(entity, e_cls) for e_cls in excluded_esdlClasses):
                    selected_entities.append(entity)

        filters = self.args.get("filter", [])
        if filters:
            selected_entities = [e for e in selected_entities if self._passes_filter(e, filters)]

        if len(properties):
            self.datasets["extracted_properties"] = {}
            for p in properties:
                self.datasets["extracted_properties"][p] = []
                for entity in selected_entities:
                    e_property = utils.get_attribute(entity, p)
                    self.datasets["extracted_properties"][p].append(e_property)
           
        return selected_entities

    def _passes_filter(self, entity, filters: list) -> bool:
        for cond in filters:
            attr = cond["attribute"]
            value = utils.get_attr_or_ref_attr(entity, attr)

            if value == self.NOT_FOUND:
                raise ValueError(f"Filter attribute [{attr}] not found on entity type.")
            if value == self.UNSET:
                # Allow "Unset" to be listed explicitly in 'match', e.g. to also catch an enum's implicit default.
                match_values = cond.get("match")
                match_list = [match_values] if isinstance(match_values, str) else match_values
                if match_list is not None and any(v.lower() == self.UNSET.lower() for v in match_list):
                    continue
                return False

            count_cond = cond.get("count")
            if isinstance(value, EOrderedSet):
                if count_cond is None:
                    raise ValueError(
                        f"Filter attribute [{attr}] is a collection. Use 'count' to filter by collection size."
                    )
                n = len(value)
                if count_cond.get("min") is not None and n < count_cond["min"]:
                    return False
                if count_cond.get("min_exclusive") is not None and n <= count_cond["min_exclusive"]:
                    return False
                if count_cond.get("max") is not None and n > count_cond["max"]:
                    return False
                if count_cond.get("max_exclusive") is not None and n >= count_cond["max_exclusive"]:
                    return False
                continue  # collection handled, skip scalar checks

            match_values = cond.get("match")
            if match_values is not None:
                match_list = match_values if isinstance(match_values, list) else [match_values]
                value_str = getattr(value, "name", str(value)).lower()
                if value_str not in [v.lower() for v in match_list]:
                    return False
                
            contains_values = cond.get("contains")
            if contains_values is not None:
                contains_list = contains_values if isinstance(contains_values, list) else [contains_values]
                value_str = getattr(value, "name", str(value)).lower()
                if not any(c.lower() in value_str for c in contains_list):
                    return False

            in_range = cond.get("in_range")
            if in_range:
                if in_range.get("min") is not None and value < in_range["min"]:
                    return False
                if in_range.get("min_exclusive") is not None and value <= in_range["min_exclusive"]:
                    return False
                if in_range.get("max") is not None and value > in_range["max"]:
                    return False
                if in_range.get("max_exclusive") is not None and value >= in_range["max_exclusive"]:
                    return False

        return True