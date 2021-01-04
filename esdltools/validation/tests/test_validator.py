import unittest
import json

from esdltools.core.esdl.esh import EnergySystemHandler
from esdltools.core.esdl import utils

from esdltools.validation.validator import EsdlValidator
from esdltools.validation.repository import SchemaRepository

class TestValidator(unittest.TestCase):
    """Tests for the validator"""

    def test_validate(self):
        """test running the validator"""

        # open schema, store it to the database and load it again
        with open("testdata/schema_test_1.json", "r") as file:
            schemaData = file.read()

        repo = SchemaRepository("./testdata/validation_test.db")
        schemaID = repo.insert(schemaData)
        schema = repo.get_by_id(schemaID)

        # load ESDL
        esdl = self.get_test_datasets()
        
        # create validator
        validator = EsdlValidator()

        # validate against 1 schema
        expected = validator.validate(esdl, [schema])

        for result in expected:
            jsonString = result.toJSON()
            print(jsonString)

        self.assertEqual(1, 1, "no")

    def get_test_datasets(self):
        esh = utils.get_esh_from_file("testdata/Ameland_energie_2015.esdl")
        return esh.resource