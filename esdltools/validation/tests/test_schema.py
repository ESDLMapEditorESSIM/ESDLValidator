import unittest
import json


class TestSchema(unittest.TestCase):
    """Tests for the model.utils functions"""

    def test_load_json(self):
        """Test if get_esdl_class_from_string returns the correct classes and exceptions"""

        with open('testdata/schema_test_1.json', 'r') as file:
            data = file.read()

        schema = json.loads(data)
        self.assertEqual(schema["name"], "Schema test 1", "Name of loaded schema was unexpected")
        self.assertEqual(schema["rules"][0]["name"], "check_asset_id_notnull", "Class string casing should be ignored and return esdl.Asset")
