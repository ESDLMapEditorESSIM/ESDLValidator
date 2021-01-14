
def get_args_property(args: dict, propertyName: str, default=None):
    """Get a property from args send to the function, property name casing will be ignored

    Args:
        args (dict): Dictionary of args send to the function
        propertyName (str): Name of the property to retrieve the value for
        default (Object): Optional default value that will return when property not found, defaults to None

    Returns:
        property value: The object matching the input string, default if not found
        found (Boolean): If the property was found or not
    """

    arguments = {k.lower(): v for k, v in args.items()}
    key = propertyName.lower()

    if key in arguments.keys():
        return arguments[key], True

    return default, False
