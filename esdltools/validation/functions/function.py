import logging

from abc import ABCMeta, abstractmethod
from typing import Callable

from esdltools.validation.functions import utils

logger = logging.getLogger(__name__)


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


class FunctionFactory:
    """The factory class for creating functions"""

    selectRegistry = {}

    @classmethod
    def register_select(cls, name: str) -> Callable:

        def inner_wrapper(wrapped_class: SelectBase) -> Callable:
            if name in cls.selectRegistry:
                logger.warning("Select function %s already exists. Will replace it", name)

            cls.selectRegistry[name] = wrapped_class
            return wrapped_class

        return inner_wrapper

    @classmethod
    def create_select(cls, name: str, **kwargs) -> 'FunctionBase':
        """Factory command to create the select function.
        This method gets the appropriate select class from the registry
        and creates an instance of it, while passing in the parameters
        given in ``kwargs``.

        Args:
            name (str): The name of the select function to create.

        Returns:
            An instance of the select that is created.
        """

        if name not in cls.selectRegistry:
            logger.warning('Select functions %s does not exist in the registry', name)
            return None

        exec_class = cls.selectRegistry[name]
        executor = exec_class(**kwargs)
        return executor


class ArgDefinition:
    """Class to describe a function argument"""
    
    def __init__(self, name, description, mandatory):
        self.name = name
        self.description = description
        self.mandatory = mandatory
