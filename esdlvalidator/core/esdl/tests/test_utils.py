import unittest

from esdlvalidator.core.esdl import esdl
from esdlvalidator.core.esdl.esh import EnergySystemHandler
from esdlvalidator.core.esdl import utils

testESDL = "testdata/ameland_energie_2015.esdl"


class TestUtils(unittest.TestCase):
    """Tests for the model.utils functions"""

    def test_esdl_class_from_string(self):
        """Test if get_esdl_class_from_string returns the correct classes and exceptions"""

        actual = utils.get_esdl_class_from_string("Asset")
        expected = esdl.Asset
        self.assertEqual(actual, expected, "String 'Asset' should return esdl.Asset")

        actual = utils.get_esdl_class_from_string("aSseT")
        expected = esdl.Asset
        self.assertEqual(actual, expected, "Class string casing should be ignored and return esdl.Asset")

    def test_esdl_class_from_string_throw(self):
        """Test if get_esdl_class_from_string throws an exception if class is not found"""

        with self.assertRaises(ValueError,):
            utils.get_esdl_class_from_string("thisisnotaknownclass")

    def test_get_esh_from_file(self):
        """Test if an ESDL can be loaded into an EnergySystemHandler"""

        actual = utils.get_esh_from_file(testESDL)
        expected = EnergySystemHandler
        self.assertIsInstance(actual, expected, "Loaded esh is not of type EnergySystemHandler")

    def test_get_esh_from_file_throw(self):
        """Test if loading an esdl throws an error if file not found"""

        with self.assertRaises(OSError,):
            utils.get_esh_from_file("this_file_does_not_exist.esdl")

    def test_get_esdl_class_names(self):
        """Test if get_esdl_class_names returns a list of class names"""

        actual = utils.get_esdl_class_names()
        expected1 = "Asset"
        expected2 = "Port"
        notExpected1 = "asset"

        self.assertIn(expected1, actual, "String 'Asset' should be in class names list")
        self.assertIn(expected2, actual, "String 'Port' should be in class names list")
        self.assertNotIn(notExpected1, actual, "String 'asset' should not be in class names list")

    def test_get_entities_from_esdl_resource_by_type(self):
        """Test getting entities from a loaded esdl by esdl type string"""

        esh = utils.get_esh_from_file(testESDL)
        actual1 = utils.get_entities_from_esdl_resource_by_type(esh.resource, "Port")
        actual2 = utils.get_entities_from_esdl_resource_by_type(esh.resource, "InPort")
        actual3 = utils.get_entities_from_esdl_resource_by_type(esh.resource, "OutPort")

        self.assertEqual(108, len(actual1), "There should be 108 found Ports")
        self.assertEqual(74, len(actual2), "There should be 74 found InPorts")
        self.assertEqual(34, len(actual3), "There should be 34 found OutPorts")
