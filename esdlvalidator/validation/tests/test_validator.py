import unittest
import json

from esdlvalidator.core.esdl.esh import EnergySystemHandler
from esdlvalidator.core.esdl import utils

from esdlvalidator.validation.validator import EsdlValidator
from esdlvalidator.validation.repository import SchemaRepository


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
        schemaResult = expected.schemas[0]

        #jsonString = schemaResult.toJSON()
        # print(jsonString)

        validation = schemaResult.validation[0]

        self.assertEqual(validation.checked, 8, "there should be 8 checked")
        self.assertEqual(len(validation.warnings), 1, "there should be 1 warning")
        self.assertEqual(validation.warnings[0], "Area does not have a scope: value equals undefined", "Warning should say: Area does not have a scope: value equals undefined")

    def get_test_datasets(self):
        esh = utils.get_esh_from_file("testdata/Ameland_energie_2015.esdl")
        return esh.resource
