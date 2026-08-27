import builtins

from esdlvalidator.core.esdl import utils as esdlUtils
from pyecore.ecore import EValue, EOrderedSet


def get_attr_or_ref_attr(obj, attr_path: str):
    """
    Retrieves an attribute value or a nested reference attribute value from an ESDL object.

    Args:
        obj: The ESDL object to query.
        attr_path (str): A dot-separated string representing the attribute path.
                         For instance, 'power' or 'costInformation.investmentCosts.value'.
                         The attr_path string is case sensitive.

    Returns:
        The attribute value if found and set.
        'Not found' if the attribute does not exist.
        'Unset' if the attribute exists but is not set.
    """
    attr, *remaining = attr_path.split(".", 1)

    not_found_keyword = "Not found"
    if getattr(obj, attr, not_found_keyword) == not_found_keyword:
        return not_found_keyword

    if not obj.eIsSet(attr):
        return "Unset"

    value = obj.eGet(attr)

    # If the attribute is a reference object (e.g., QuantityAndUnitReference),
    # try to resolve it to the actual target entity.
    if hasattr(value, "reference") and value.reference:
        value = value.reference

    if not remaining:
        return value

    return get_attr_or_ref_attr(value, remaining[0])


def get_ref(references: EOrderedSet, ref_filter: dict):
    """
    Filters a set of ESDL references to find the first entity matching the given type and attribute criteria.

    Args:
        references: A collection of ESDL entities.
        ref_filter: A dictionary with keys:
            - 'is_type': the expected ESDL type as a string.
            - 'match': [optional] a dictionary of attribute names and expected values.

    Returns:
        The first matching entity, or None if no match is found.
    """
    raw_types = ref_filter["is_type"]
    match_dict = ref_filter.get("match", {})

    if isinstance(raw_types, str):
        type_list = [raw_types]
    else:
        type_list = list(raw_types)

    esdl_classes = []
    for t in type_list:
        esdl_cls = esdlUtils.get_esdl_class_from_string(t)[0]
        esdl_classes.append(esdl_cls)

    for entity in references:
        if not any(isinstance(entity, cls) for cls in esdl_classes):
            continue
        if all(get_attr_or_ref_attr(entity, key) == value for key, value in match_dict.items()):
            return entity

    return None

def has_attribute(obj, name: str) -> bool:
    # give a default "nothing_found" since None can be the actual returned value
    result = get_attribute(obj, name, "nothing_found")
    return False if result == "nothing_found" else True


def get_attribute(obj, name: str, default=None):
    """Get a property from args send to the function, property name casing will be ignored

    Args:
        obj: List, class or dictionary to get a property value from
        name (str): The property to get
        default (Object): Optional default value that will return when property not found,
                          defaults to None

    Returns:
        property value: The property value found for given name, default if not found
    """

    parts = name.split(".", 1)
    value = default

    if not isinstance(obj, dict):
        if is_iterable(obj):
            value = []
            for sub_obj in obj:
                value.append(get_attribute(sub_obj, parts[0], default))
        else:
            for a in dir(obj):
                if a.lower() == parts[0].lower():
                    value = builtins.getattr(obj, a, default)
                    break
    else:
        attributes = {k.lower(): v for k, v in obj.items()}
        key = parts[0].lower()
        value = attributes[key] if key in attributes.keys() else default

    if isinstance(value, list):
        vals = []
        for v in value:
            if isinstance(v, EValue):
                vals.append(v._value)
            else:
                vals.append(v)
        value = vals
    elif value is not None and value != default and len(parts) > 1:
        value = get_attribute(value, parts[1])

        if isinstance(value, EValue):
            value = value._value

    return value


def is_iterable(obj) -> bool:
    try:
        iter(obj)
        return True
    except TypeError:
        return False
