import unittest

from model import esdl
from model import utils


class TestUtils(unittest.TestCase):
    """Tests for the model.utils functions"""

    def test_esdl_class_from_string(self):
        """Test if get_esdl_class_from_string returns the correct classes and exceptions"""

        actual = utils.get_esdl_class_from_string("Asset")
        expected = esdl.Asset
        self.assertEqual(actual, expected,
                         "String 'Asset' should return esdl.Asset")

        actual = utils.get_esdl_class_from_string("aSseT")
        expected = esdl.Asset
        self.assertEqual(
            actual, expected, "Class string casing should be ignored and return esdl.Asset")

        with self.assertRaises(ValueError,):
            utils.get_esdl_class_from_string("thisisnotaknownclass")

    def test_get_esdl_class_names(self):
        """Test if get_esdl_class_names returns a list of class names"""

        actual = utils.get_esdl_class_names()
        expected1 = "Asset"
        expected2 = "Port"
        notExpected1 = "asset"
        self.assertIn(expected1, actual,
                      "String 'Asset' should be in class names list")
        self.assertIn(expected2, actual,
                      "String 'Port' should be in class names list")
        self.assertNotIn(notExpected1, actual,
                         "String 'asset' should not be in class names list")
