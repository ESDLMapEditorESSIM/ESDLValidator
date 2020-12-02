import logging

from abc import ABCMeta, abstractmethod
from typing import Callable

logger = logging.getLogger(__name__)


class FunctionBase(metaclass=ABCMeta):

    @abstractmethod
    def __init__(self, **kwargs):
        pass


class SelectBase(FunctionBase):
    """Base class for a select function"""

    def __init__(self, **kwargs):
        self.alias = kwargs["alias"]
        self.data = kwargs["data"]
        self.args = kwargs["args"]
        self.result = self._execute(self.data, self.args)

    @abstractmethod
    def _execute(self, data, args):
        """ Abstract method to run a select command """
        pass


class FunctionFactory:
    """The factory class for creating functions"""

    selectRegistry = {}
    """Internal registry for available select functions"""

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
        """ Factory command to create the select function.
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
