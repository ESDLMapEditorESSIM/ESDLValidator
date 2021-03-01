import unittest

from esdlvalidator.validation.tests import get_test_xml_string
from esdlvalidator.validation.validator_xsd import XsdValidator


class TestXsdValidator(unittest.TestCase):
    """Tests for the validator"""

    @classmethod
    def setUpClass(cls):
        super(TestXsdValidator, cls).setUpClass()
        cls.xmlString = get_test_xml_string()

    def test_validate_xsd(self):
        xsdValidator = XsdValidator()
        result = xsdValidator.validate(self.xmlString)

        self.assertEqual(len(result.errors), 2, "there should be xsd errors")
        self.assertIsNotNone(result.version, "version should be there")
        self.assertEqual(result.valid, False, "Should return not valid")
