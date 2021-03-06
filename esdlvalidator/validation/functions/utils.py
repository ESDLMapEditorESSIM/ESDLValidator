import builtins

from pyecore.ecore import EValue


def has_attribute(obj, name: str) -> bool:
    # give a default "nothing_found" since None can be the actual returned value
    result = get_attribute(obj, name, "nothing_found")
    return False if result is "nothing_found" else True


def get_attribute(obj, name: str, default=None) -> bool:
    """Get a property from args send to the function, property name casing will be ignored

    Args:
        obj: List, class or dictionary to get a property value from
        name (str): The property to get
        default (Object): Optional default value that will return when property not found, defaults to None

    Returns:
        property value: The property value found for given name, default if not found
    """

    parts = name.split(".", 1)
    value = default

    if not isinstance(obj, dict):
        if isinstance(obj, list):
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


def create_offending_asset_msg(value):
    return {"offending_asset": value.id} if has_attribute(value, "id") else {}


def is_iterable(obj) -> bool:
    try:
        iter(obj)
        return True
    except TypeError:
        return False
