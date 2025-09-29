import builtins

from pyecore.ecore import EValue


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

    if not remaining:
        return value

    return get_attr_or_ref_attr(value, remaining[0])


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
