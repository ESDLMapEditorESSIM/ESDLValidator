import unittest

from esdlvalidator.core.esdl import utils

from esdlvalidator.validation.validator import EsdlValidator
from esdlvalidator.validation.repository import SchemaRepository


class TestValidator(unittest.TestCase):
    """Tests for the validator"""

    def test_validate_schema_1(self):
        """test running the validator"""

        # open schema, store it to the database and load it again
        with open("testdata/schema_test_1.json", "r") as file:
            schemaData = file.read()

        repo = SchemaRepository("./testdata/validation_test.db")
        schemaID = repo.insert(schemaData)
        schema = repo.get_by_id(schemaID)

        # load ESDL
        esdl = self.get_test_dataset_ameland()

        # create validator
        validator = EsdlValidator()

        # validate against 1 schema
        expected = validator.validate(esdl, [schema])
        schemaResult = expected.schemas[0]
        validation = schemaResult.validation[0]

        self.assertEqual(validation.checked, 8, "there should be 8 checked")
        self.assertEqual(len(validation.warnings), 1, "there should be 1 warning")
        self.assertEqual(validation.warnings[0], "Area does not have a scope: value equals undefined for entity BU00600007", "Warning should say: Area does not have a scope: value equals undefined for entity BU00600007")

    def test_validate_schema_2(self):
        """test running the validator on test schema 2 with and, or defined"""

        # open schema, store it to the database and load it again
        with open("testdata/schema_test_2.json", "r") as file:
            schemaData = file.read()

        repo = SchemaRepository("./testdata/validation_test.db")
        schemaID = repo.insert(schemaData)
        schema = repo.get_by_id(schemaID)

        # load ESDL
        esdl = self.get_test_dataset_hybrid()

        # create validator
        validator = EsdlValidator()

        # validate against 1 schema
        expected = validator.validate(esdl, [schema])
        #schemaResult = expected.schemas[0]
        #validation = schemaResult.validation[0]

    def get_test_dataset_ameland(self):
        esh = utils.get_esh_from_file("testdata/Ameland_energie_2015.esdl")
        return esh.resource

    def get_test_dataset_hybrid(self):
        esh = utils.get_esh_from_file("testdata/hybrid_hp_with_pv_storage.esdl")
        return esh.resource
