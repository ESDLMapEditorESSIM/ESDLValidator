import unittest

from esdlvalidator.core.esdl import utils

from esdlvalidator.validation.validator import EsdlValidator
from esdlvalidator.validation.repository import SchemaRepository


class TestValidator(unittest.TestCase):
    """Tests for the validator"""

    def test_validate_schema_1(self):
        """test running the validator"""

        # prepare
        schema = self.get_test_schema_id(self.get_test_schema_data("testdata/schema_test_1.json"))
        esdl = self.get_test_dataset_ameland()
        validator = EsdlValidator()

        # validate against 1 schema
        result = validator.validate(esdl, [schema])
        schemaResult = result.schemas[0]
        validation = schemaResult.validations[0]

        self.assertEqual(validation.checked, 8, "there should be 8 checked")
        self.assertEqual(len(validation.warnings), 1, "there should be 1 warning")
        self.assertEqual(validation.warnings[0], "Area does not have a scope: value equals undefined for entity BU00600007", "Warning should say: Area does not have a scope: value equals undefined for entity BU00600007")

    def test_validate_schema_2(self):
        """test running the validator on test schema 2 with and, or defined"""

        # prepare
        schema = self.get_test_schema_id(self.get_test_schema_data("testdata/schema_test_2.json"))
        esdl = self.get_test_dataset_hybrid()
        validator = EsdlValidator()

        # validate against 1 schema
        result = validator.validate(esdl, [schema])
        schemaResult = result.schemas[0]
        validation = schemaResult.validations[0]

        self.assertEqual(validation.checked, 3, "there should be 3 checked since there are only 3 producers")
        self.assertEqual(len(validation.errors), 2, "there should be 2 errors since 1 producer validates ok")
        self.assertEqual(validation.errors[0], "Consumer missing power and marginal costs or no energy profile connected: None", "Warning should say: Consumer missing power and marginal costs or no energy profile connected: None")

    def get_test_schema_data(self, file):
        with open(file, "r") as file:
            schemaData = file.read()

        return schemaData

    def get_test_schema_id(self, schemaData):
        repo = SchemaRepository("./testdata/validation_test.db")
        schemaID = repo.insert(schemaData)
        return repo.get_by_id(schemaID)

    def get_test_dataset_ameland(self):
        esh = utils.get_esh_from_file("testdata/Ameland_energie_2015.esdl")
        return esh.resource

    def get_test_dataset_hybrid(self):
        esh = utils.get_esh_from_file("testdata/hybrid_hp_with_pv_storage.esdl")
        return esh.resource
