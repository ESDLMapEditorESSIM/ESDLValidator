import inspect

from model import esdl


def get_esdl_class_from_string(name):
    """Retrieve an ESDL class based on its name

    Args:
        name (str): String of the ESDL class to retrieve

    Returns:
        class: The ESDL class matching the input string

    Raises:
        ValueError: If class wass not found

    ToDo:
        eval: Is the eval safe here, only runs when class is found, also gets prefixed with .esdl
    """

    classNames = get_esdl_class_names()
    for className in classNames:
        if className.lower() == name.lower():
            return eval("esdl." + className)

    raise ValueError("ESDL class not found: {0}".format(name))


def get_esdl_class_names():
    """Retrieve all class names from the ESDL model

    Returns:
        list: list of all class names from the ESDL model
    """

    classes = []
    for name, obj in inspect.getmembers(esdl):
        if inspect.isclass(obj):
            classes.append(name)

    return classes
