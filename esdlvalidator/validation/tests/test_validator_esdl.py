import unittest

from esdlvalidator.validation.tests import get_test_schema_data, get_test_schema_id, get_test_dataset_ameland, get_test_dataset_hybrid
from esdlvalidator.validation.validator_esdl import EsdlValidator


class TestValidator(unittest.TestCase):
    """Tests for the validator"""

    @classmethod
    def setUpClass(cls):
        super(TestValidator, cls).setUpClass()
        cls.schemaOne = get_test_schema_id(get_test_schema_data("testdata/schema_test_1.json"))
        cls.schemaTwo = get_test_schema_id(get_test_schema_data("testdata/schema_test_2.json"))
        cls.esdlAmeland = get_test_dataset_ameland()
        cls.esdlHybrid = get_test_dataset_hybrid()

    def test_validate_schema_1(self):
        """test running the validator for test schema 1 and ameland test esdl"""

        # prepare
        validator = EsdlValidator()

        # execute, validate against 1 schema
        result = validator.validate(self.esdlAmeland, [self.schemaOne])
        validationAreaScope = result.schemas[0].validations[0]

        # assert
        self.assertEqual(validationAreaScope.checked, 8, "there should be 8 checked")
        self.assertEqual(len(validationAreaScope.warnings), 1, "there should be 1 warning")
        self.assertEqual(validationAreaScope.warnings[0], "Area does not have a scope: scope cannot be null for entity BU00600007", "Warning should say: Area does not have a scope: scope cannot be null for entity BU00600007")

    def test_validate_schema_2(self):
        """test running the validator on test schema 2 on dynamic test esdl with a real world scenario, multiple validations including and + or"""

        # prepare
        validator = EsdlValidator()

        # execute, validate against 1 schema
        result = validator.validate(self.esdlHybrid, [self.schemaTwo])
        validationProducer = result.schemas[0].validations[0]
        validationStorage = result.schemas[0].validations[1]
        validationGasHeater = result.schemas[0].validations[2]
        validationHeatpump = result.schemas[0].validations[3]
        validationCostsInRange = result.schemas[0].validations[4]

        # assert
        self.assertEqual(validationProducer.checked, 3, "there should be 3 checked since there are only 3 producers")
        self.assertEqual(len(validationProducer.errors), 2, "there should be 2 errors since 1 producer validates ok")
        self.assertEqual(validationProducer.errors[0], "Consumer missing power and marginal costs or no energy profile connected: property port.profile value is None", "Warning should say: Consumer missing power and marginal costs or no energy profile connected: property port.profile value is None")

        self.assertEqual(validationStorage.checked, 1, "there should be 1 checked storage")
        self.assertEqual(len(validationStorage.errors), 0, "there should be 0 errors, storage should be correct")

        self.assertEqual(validationGasHeater.checked, 1, "there should be 1 checked GasHeater")
        self.assertEqual(len(validationGasHeater.warnings), 0, "there should be 0 warnings, gasheater should be correct")

        self.assertEqual(validationHeatpump.checked, 1, "there should be 1 checked HeatPump")
        self.assertEqual(len(validationHeatpump.warnings), 1, "there should be 1 warnings, heatpump should be missing a control strategy")

        self.assertEqual(validationCostsInRange.checked, 3, "there should be 3 checked costs")
        self.assertEqual(len(validationCostsInRange.warnings), 1, "there should be 1 warnings")

    def test_validate_multiple_schemas(self):
        """Test if the validator works with checking multiple schemas"""

        # prepare
        validator = EsdlValidator()

        # execute, validate against 2 schemas
        result = validator.validate(self.esdlHybrid, [self.schemaOne, self.schemaTwo])

        # assert
        self.assertEqual(len(result.schemas), 2, "there should be 2 schemas in the result")
        self.assertEqual(result.valid, False, "There should be errors in the schema's, valid should be false")
        self.assertEqual(result.errorCount, 2, "There should be a total of 2 errors")
        self.assertEqual(result.warningCount, 3, "There should be 3 warnings in total")
