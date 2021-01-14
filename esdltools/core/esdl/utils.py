import inspect

from pathlib import Path

from esdltools.core.esdl import esdl
from esdltools.core.esdl.esh import EnergySystemHandler
from esdltools.core.exceptions import InvalidESDL


def get_esdl_class_from_string(name):
    """Retrieve an ESDL class based on its name

    Args:
        name (str): String of the ESDL class to retrieve

    Returns:
        class: The ESDL class matching the input string

    Raises:
        ValueError: If class is not found

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


def get_esh_from_file(filepath):
    """Create and get an energy system handler from local file

    Args:
        filepath (str): Path to the ESDL file 

    Returns:
        esh: EnergySystemHandler loaded from ESDL file

    Raises:
        OSError: If ESDL file is not found on disk
    """

    checkFile = Path(filepath)
    if not checkFile.is_file():
        raise OSError("ESDL file not found: {0}".format(filepath))

    with open(filepath, 'r') as file:
        esdlString = file.read()

    return get_esh_from_string(esdlString)


def get_esh_from_string(esdlString: str):
    """Create and get an energy system handler from a string containing the ESDL

    Args:
        esdlString (str): String containing the ESDL

    Returns:
        esh: EnergySystemHandler loaded from ESDL file

    Raises:
        InvalidESDL: If the system was unable to read the data as ESDL
    """

    esh = EnergySystemHandler()

    try:
        esh.load_from_string(esdlString)
    except:
        raise InvalidESDL

    return esh


def get_entities_from_esdl_resource_by_type(esdlSource, esdlType):
    """Loop trough all loaded ESDL entities and return entities for given type

    Args:
        esdlSource (pyecore.resource): resource of a loaded ESDL
        esdlType (str): String of the ESDL entity type to retrieve

    Returns:
        list: list of all ESDL entities for given type
    """

    esdlClass = get_esdl_class_from_string(esdlType)
    entities = []

    for uuid in esdlSource.uuid_dict:
        esdlObject = esdlSource.uuid_dict[uuid]
        if isinstance(esdlObject, esdlClass):
            entities.append(esdlObject)

    return entities
