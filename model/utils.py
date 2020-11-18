import inspect

from model import esdl

def getEsdlClassFromString(name):
    """Retrieve an ESDL class based on its name
    
    Parameters
    ----------
    name : str
        Name of the wanted ESDL class

    Raises
    ------
    ValueError
        If class wass not found
    """

    classNames = getEsdlClassNames()
    if name in classNames:
        return eval("esdl." + name)
    
    raise ValueError("ESDL class not found: {}".format(name))

def getEsdlClassNames():
    classes = []
    
    for name, obj in inspect.getmembers(esdl):
        if inspect.isclass(obj):
            classes.append(name)
    
    return classes