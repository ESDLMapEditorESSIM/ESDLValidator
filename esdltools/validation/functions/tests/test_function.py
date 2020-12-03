import unittest
import json
import types

from esdltools.core.esdl import utils
from esdltools.core.esdl.esh import EnergySystemHandler
from esdltools.validation.functions.function import FunctionFactory, ArgDefinition, FunctionType


class TestFunction(unittest.TestCase):
    """Tests the function factory and base classes"""

    def test_arg_definition(self):
        """Test if ArgDefinition works"""

        actual = ArgDefinition("MyName", "MyDescription", True)
        self.assertEqual(actual.name, "MyName", "ArgDefinition name should be MyName")
        self.assertEqual(actual.description, "MyDescription", "ArgDefinition description should be MyDescription")
        self.assertEqual(actual.mandatory, True, "ArgDefinition mandatory should be set to True")

    def test_function_factory_autoregister(self):
        """Test if the FunctionFactory is registering functions automatically"""

        actual = FunctionFactory.registries.get(FunctionType.SELECT)
        self.assertGreater(len(actual), 0, "Select registry should contain registered functions")

    def test_function_factory_register_check(self):
        """Test if certain functions are registered"""

        actual = FunctionFactory.registries.get(FunctionType.SELECT)
        self.assertEqual(actual["get"].__class__.__name__, "ABCMeta", "Get function should be present in the select registry")
        self.assertEqual(actual["sum"].__class__.__name__, "ABCMeta", "Sum function should be present in the select registry")
        self.assertEqual(actual["avg"].__class__.__name__, "ABCMeta", "Avg function should be present in the select registry")

    def test_instantiate_function_from_factory(self):
        """Test if the factory is able to create and initialize a select function"""

        mockResource = types.SimpleNamespace()
        mockResource.uuid_dict = {}

        actual = FunctionFactory.create(FunctionType.SELECT, "get", alias="my_alias", data=mockResource, args={"type": "Port"})
        self.assertIsNotNone(actual, "Create function should not be None")
        self.assertEqual(actual.alias, "my_alias", "Select function alias should return my_alias")
        self.assertEqual(actual.args["type"], "Port", "Args type should return Port")

    def test_instantiate_function_from_factory_wrong_param(self):
        """Test if the factory throws a ValueError when trying to create a function with missing args
        the get function should have a mandatory arg defined, when initializing without it, it should raise an exception
        """

        with self.assertRaises(ValueError,):
            FunctionFactory.create(FunctionType.SELECT, "get", alias="my_alias", data=None, args={"this_is_an_arg": "Port"})

    def test_function_type_enum(self):
        """Test if the function type enum is working"""

        actual1 = FunctionType.SELECT
        actual2 = FunctionType("select") # Should not be used, use from_str
        actual3 = FunctionType.from_str("select")
        actual4 = FunctionType.from_str("check")
        defaultMsg = "Enum should be the same"

        self.assertEqual(actual1, FunctionType.SELECT, defaultMsg)
        self.assertEqual(actual2, FunctionType.SELECT, defaultMsg)
        self.assertEqual(actual3, FunctionType.SELECT, defaultMsg)
        self.assertEqual(actual4, FunctionType.CHECK, defaultMsg)

        with self.assertRaises(ValueError,):
            FunctionType.from_str("does_not_exist")
