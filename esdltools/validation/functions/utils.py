
def get_args_property(args: dict, propertyName: str):
    """Get a property from args send to the function, property name casing will be ignored

    Args:
        args (dict): Dictionary of args send to the function
        propertyName (str): Name of the property to retrieve the value for

    Returns:
        property value: The ESDL class matching the input string
        found (Boolean): If the property was found or not

    """

    arguments = {k.lower(): v for k, v in args.items()}
    key = propertyName.lower()

    if key in arguments.keys():
        return arguments[key], True

    return None, False
