import unittest
import json


class TestValidator(unittest.TestCase):
    """Tests for the validator"""

    def test_load_json(self):
        """Test if get_esdl_class_from_string returns the correct classes and exceptions"""

        with open('testdata/schema_test_1.json', 'r') as file:
            data = file.read()
