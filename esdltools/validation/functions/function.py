import logging

from abc import ABCMeta, abstractmethod
from typing import Callable
from enum import Enum
from esdltools.validation.functions import utils

logger = logging.getLogger(__name__)


class FunctionType(Enum):
    SELECT = "select"
    CHECK = "check"

    @staticmethod
    def from_str(typeStr):
        for f in FunctionType:
            if f.value == typeStr:
                return f
        
        raise ValueError("FunctionType {0} does not exist".format(typeStr))



class FunctionBase(metaclass=ABCMeta):
    """Base class for a function"""

    @abstractmethod
    def __init__(self, **kwargs):
        pass


class SelectBase(FunctionBase):
    """Base class for a select function"""

    def __init__(self, **kwargs):
        self.alias = kwargs["alias"]
        self.data = kwargs["data"]
        self.args = kwargs["args"]
        self._run()

    def _run(self):
        self._check_args()
        self.result = self._execute(self.data, self.args)

    def _check_args(self):
        argDefinitions = self.get_arg_definitions()
        if argDefinitions is None:
            return

        for arg in argDefinitions:
            if arg.mandatory:
                _, propFound = utils.get_args_property(self.args, arg.name)
                if not propFound:
                    raise ValueError("Mandatory property not found in args: {0}".format(arg.name))

    @abstractmethod
    def get_arg_definitions(self):
        """Abstract method to get function arg defenitions"""
        pass

    @abstractmethod
    def _execute(self, data, args):
        """Abstract method to run a select function"""
        pass


class CheckBase(FunctionBase):
    """Base class for a check function"""

    def __init__(self, **kwargs):
        self.data = kwargs["data"]
        self.args = kwargs["args"]
        self._run()

    def _run(self):
        pass

    def _check_args(self):
        argDefinitions = self.get_arg_definitions()
        if argDefinitions is None:
            return

        for arg in argDefinitions:
            if arg.mandatory:
                _, propFound = utils.get_args_property(self.args, arg.name)
                if not propFound:
                    raise ValueError("Mandatory property not found in args: {0}".format(arg.name))

    @abstractmethod
    def get_arg_definitions(self):
        """Abstract method to get function arg defenitions"""
        pass

    @abstractmethod
    def _execute(self, data, args):
        """Abstract method to run a select function"""
        pass


class FunctionFactory:
    """The factory class for creating functions"""

    registries = {
        FunctionType.SELECT: {},
        FunctionType.CHECK: {}
    }

    baseClasses = {
        FunctionType.SELECT: SelectBase,
        FunctionType.CHECK: CheckBase
    }

    @classmethod
    def get_registry(cls, functionType: FunctionType):
        return cls.registries.get(functionType)

    @classmethod
    def get_base_class(cls, functionType: FunctionType):
        return cls.baseClasses.get(functionType)

    @classmethod
    def register(cls, functionType: FunctionType, name: str) -> Callable:
        registry = cls.get_registry(functionType)
        baseClass = cls.get_base_class(functionType)

        def inner_wrapper(wrapped_class: baseClass) -> Callable:
            if name in registry:
                logger.warning("function %s already exists. Will replace it", name)

            registry[name] = wrapped_class
            return wrapped_class

        return inner_wrapper

    @classmethod
    def create(cls, functionType: FunctionType, name: str, **kwargs) -> 'FunctionBase':
        """Factory command to create a function.
        This method gets the appropriate class from a registry 
        and creates an instance of it, while passing in the parameters
        given in ``kwargs``.

        Args:
            functionType (FunctionType): Type of the function to create
            name (str): The name of the select function to create.

        Returns:
            An instance of the function that is created.
        """

        registry = cls.get_registry(functionType)

        if name not in registry:
            logger.warning('Functions %s does not exist in the registry', name)
            return None

        function_class = registry[name]
        function = function_class(**kwargs)
        return function


class ArgDefinition:
    """Class to describe a function argument"""
    
    def __init__(self, name, description, mandatory):
        self.name = name
        self.description = description
        self.mandatory = mandatory
