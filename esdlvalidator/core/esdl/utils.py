import inspect

from pathlib import Path

from esdlvalidator.core.esdl import esdl
from esdlvalidator.core.esdl.esh import EnergySystemHandler
from esdlvalidator.core.exceptions import InvalidESDL
from esdlvalidator.validation.functions import utils


def get_esdl_class_from_string(names):
    """Retrieve an ESDL class based on its name

    Args:
        name (str): String of the ESDL class to retrieve

    Returns:
        class: The ESDL classes matching the input string

    Raises:
        ValueError: If class is not found

    ToDo:
        eval: Is the eval safe here, only runs when class is found, also gets prefixed with .esdl
    """

    classes = []
    if not isinstance(names, list):
        names = [names]

    classNames = get_esdl_class_names()
    for name in names:
        for className in classNames:
            if className.lower() == name.lower():
                classes.append(eval("esdl." + className))

    if len(classes) == 1:
        return classes[0]
    elif len(classes) > 1:
        return classes
    else:
        raise ValueError("ESDL classes not found: {0}".format(names))


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
    except Exception as e:
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

    esdlClasses = get_esdl_class_from_string(esdlType)
    if not isinstance(esdlClasses, list):
        esdlClasses = [esdlClasses]

    entities = []

    for uuid in esdlSource.uuid_dict:
        conditions = []
        esdlObject = esdlSource.uuid_dict[uuid]
        for esdlClass in esdlClasses:
            conditions.append(isinstance(esdlObject, esdlClass))
        if all(conditions):
            entities.append(esdlObject)

    return entities


def get_references_from_assets_by_type(assets, referenceType):
    """Loop trough all loaded ESDL assets and return references for given type

    Args:
        assets (list): list of ESDL assets
        referenceType (str): String of the ESDL reference type to retrieve

    Returns:
        list: list of all ESDL entities for given type
    """

    entities = []
    esdlClasses = get_esdl_class_from_string(referenceType)

    if not isinstance(assets, list):
        assets = [assets]

    if not isinstance(esdlClasses, list):
        esdlClasses = [esdlClasses]

    for asset in assets:
        for ref in asset.eAllContents():
            for esdlClass in esdlClasses:
                if ref is not None and isinstance(ref, esdlClass):
                    entities.append(ref)

    return entities


def get_entities_from_esdl_resource_but_for_type(esdlSource, esdlType):
    """Loop trough all loaded ESDL entities and return entities except given type

    Args:
        esdlSource (pyecore.resource): resource of a loaded ESDL
        esdlType (str): String of the ESDL entity type to retrieve

    Returns:
        list: list of all ESDL entities except given type
    """

    esdlClasses = get_esdl_class_from_string(esdlType)
    entities = []

    for uuid in esdlSource.uuid_dict:
        conditions = []
        esdlObject = esdlSource.uuid_dict[uuid]
        for esdlClass in esdlClasses:
            conditions.append(not isinstance(esdlObject, esdlClass))
        if any(conditions):
            entities.append(esdlObject)

    return entities
