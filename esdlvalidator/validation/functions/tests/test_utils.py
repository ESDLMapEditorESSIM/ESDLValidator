import unittest
import json

from esdlvalidator.validation.functions import utils


class TestUtils(unittest.TestCase):
    """Tests for function utils"""

    def test_get_args_property(self):
        """Test if get_args_property returns the correct values"""

        jsonArgs = "{\"my_property_1\": \"my_value\", \"My_Property_2\": 2}"
        testArgs = json.loads(jsonArgs)

        actual, found = utils.get_args_property(testArgs, "my_property_1")
        self.assertEqual(actual, "my_value", "function should have returned string my_value")
        self.assertEqual(found, True, "found should have returned True")

        actual, found = utils.get_args_property(testArgs, "my_property_2")
        self.assertEqual(actual, 2, "function should have returned 2, casing should be ignored")
        self.assertEqual(found, True, "found should have returned True")

        actual2, found2 = utils.get_args_property(testArgs, "non_existant_property_name")
        self.assertEqual(actual2, None, "function should have returned None since propery does not exist")
        self.assertEqual(found2, False, "found should have returned False")
