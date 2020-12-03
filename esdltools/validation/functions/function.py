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


class FunctionDefinition:
    """Class to describe a function"""

    def __init__(self, name, description, argDefinitions):
        self.name = name
        self.description = description
        self.argDefinitions = argDefinitions


class ArgDefinition:
    """Class to describe a function argument"""

    def __init__(self, name, description, mandatory):
        self.name = name
        self.description = description
        self.mandatory = mandatory


class FunctionBase(metaclass=ABCMeta):
    """Base class for a function"""

    def super_setup(self, **kwargs):
        self.data = kwargs["data"]
        self.args = kwargs["args"]
        self._check_args()
        self._before_execute()

    @abstractmethod
    def get_function_definition(self):
        """Abstract method to get function defenition"""
        pass

    @abstractmethod
    def _execute(self):
        """Abstract method that runs the function specific code"""
        pass

    def _before_execute(self):
        """Abstract method which is called befor execute"""
        pass

    def _check_args(self):
        argDefinitions = self.get_function_definition().argDefinitions
        if argDefinitions is None:
            return

        for arg in argDefinitions:
            if arg.mandatory:
                _, propFound = utils.get_args_property(self.args, arg.name)
                if not propFound:
                    raise ValueError("Mandatory property not found in args: {0}".format(arg.name))


class FunctionSelect(FunctionBase):
    """Base class for a select function"""

    def __init__(self, **kwargs):
        self.super_setup(**kwargs)
        self.alias = kwargs["alias"]
        self._run()

    def _run(self):
        self.result = self._execute()


class FunctionCheck(FunctionBase):
    """Base class for a check function"""

    def __init__(self, **kwargs):
        self.super_setup(**kwargs)
        self._run()

    def _run(self):
        self.result = self._execute()


class FunctionFactory:
    """The factory class for creating functions"""

    registries = {
        FunctionType.SELECT: {},
        FunctionType.CHECK: {}
    }

    baseClasses = {
        FunctionType.SELECT: FunctionSelect,
        FunctionType.CHECK: FunctionCheck
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
