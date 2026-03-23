import unittest

from esdlvalidator.validation.tests import (get_test_schema_data, get_test_schema_id, get_test_dataset_ameland,
                                            get_test_dataset_hybrid, get_test_dataset_3B_bad, get_test_dataset_PoC, get_test_dataset_single_pipes)
from esdlvalidator.validation.validator import EsdlValidator

from pathlib import Path


class TestValidator(unittest.TestCase):
    """Tests for the validator"""

    @classmethod
    def setUpClass(cls):
        super(TestValidator, cls).setUpClass()
        cls.schemaOne = get_test_schema_id(get_test_schema_data(Path.joinpath(Path(__file__).parents[3],
                                                                              "testdata/schemas/schema_test_1.json")))
        cls.schemaTwo = get_test_schema_id(get_test_schema_data(Path.joinpath(Path(__file__).parents[3],
                                                                              "testdata/schemas/schema_test_2.json")))
        cls.schemaNWN = get_test_schema_id(get_test_schema_data(Path.joinpath(Path(__file__).parents[3],
                                                                              "testdata/schemas/schema_NWN_general.json")))
        cls.esdlAmeland = get_test_dataset_ameland()
        cls.esdlHybrid = get_test_dataset_hybrid()
        cls.esdl3B = get_test_dataset_3B_bad()
        cls.esdlPOC = get_test_dataset_PoC()
        cls.esdlSingle = get_test_dataset_single_pipes()

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
        self.assertEqual(validationAreaScope.warnings[0], "Area does not have a scope: ['[scope] should be defined, but is unset.']", "Warning should say: ['[scope] should be defined, but is unset.']")

    # TODO: update these tests

    # def test_validate_schema_2(self):
    #     """test running the validator on test schema 2 on dynamic test esdl with a real world scenario, multiple validations including and + or"""

    #     # prepare
    #     validator = EsdlValidator()

    #     # execute, validate against 1 schema
    #     result = validator.validate(self.esdlHybrid, [self.schemaTwo])
    #     validationProducer = result.schemas[0].validations[0]
    #     validationStorage = result.schemas[0].validations[1]
    #     validationGasHeater = result.schemas[0].validations[2]
    #     validationHeatpump = result.schemas[0].validations[3]
    #     validationCostsInRange = result.schemas[0].validations[4]

    #     # assert
    #     self.assertEqual(validationProducer.checked, 3, "there should be 3 checked since there are only 3 producers")
    #     self.assertEqual(len(validationProducer.errors), 1, "there should be 1 errors since 2 producer validates ok")
    #     self.assertEqual(validationProducer.errors[0], "Consumer missing power and marginal costs or no energy profile connected: port.profile cannot be null for entity 5983a0f8-6f87-47b5-ba31-5e245c370dab", "Warning should say: Consumer missing power and marginal costs or no energy profile connected: port.profile cannot be null for entity 5983a0f8-6f87-47b5-ba31-5e245c370dab")

    #     self.assertEqual(validationStorage.checked, 1, "there should be 1 checked storage")
    #     self.assertEqual(len(validationStorage.errors), 0, "there should be 0 errors, storage should be correct")

    #     self.assertEqual(validationGasHeater.checked, 1, "there should be 1 checked GasHeater")
    #     self.assertEqual(len(validationGasHeater.warnings), 0, "there should be 0 warnings, gasheater should be correct")

    #     self.assertEqual(validationHeatpump.checked, 1, "there should be 1 checked HeatPump")
    #     self.assertEqual(len(validationHeatpump.warnings), 1, "there should be 1 warnings, heatpump should be missing a control strategy")

    #     self.assertEqual(validationCostsInRange.checked, 3, "there should be 3 checked costs")
    #     self.assertEqual(len(validationCostsInRange.warnings), 1, "there should be 1 warnings")

    # def test_validate_multiple_schemas(self):
    #     """Test if the validator works with checking multiple schemas"""

    #     # prepare
    #     validator = EsdlValidator()

    #     # execute, validate against 2 schemas
    #     result = validator.validate(self.esdlHybrid, [self.schemaOne, self.schemaTwo])

    #     # assert
    #     self.assertEqual(len(result.schemas), 2, "there should be 2 schemas in the result")

    # def test_validate_scheme_NWN(self):
    #     """test running the validator on test schema_NWN_general schema on dynamic test esdl"""

    #     # prepare
    #     validator = EsdlValidator()

    #     # execute, validate against 1 schema for both single  and duplicated network
    #     result = validator.validate(self.esdlPOC, [self.schemaNWN])
    #     result2 = validator.validate(self.esdlSingle, [self.schemaNWN])

    #     self.assertEqual(len(result.schemas), 1, "there should be 1 schemas in the result")

    #     for validation in result.schemas[0].validations:
    #         if validation.name == 'connected_as_consumer':
    #             self.assertEqual(len(validation.errors),2, 'there should be two assets not properly connected as '
    #                                                     'consumers')
    #         elif validation.name == "storage_chargerate_undefined":
    #             self.assertEqual(len(validation.warnings), 2)
    #         elif validation.name == "storage_dischargerate_undefined":
    #             self.assertEqual(len(validation.warnings), 1)
    #         elif validation.name == "heat_exchanger_capacity":
    #             self.assertEqual(len(validation.errors), 1)
    #         elif validation.name == "costinformation_exists":
    #             self.assertEqual(len(validation.warnings), 8)
    #         elif validation.name == "investmentcost_per_power_undefined":
    #             self.assertEqual(len(validation.errors), 2)
    #         elif validation.name == "fixed_opex_undefined":
    #             self.assertEqual(len(validation.errors), 1)
    #         elif validation.name == "var_opex_undefined":
    #             self.assertEqual(len(validation.errors), 1)
    #         elif validation.name == "non_unique_names":
    #             self.assertEqual(len(validation.errors), 2)
    #         elif validation.name == "supply_return_combination":
    #             self.assertEqual(len(validation.errors), 6)
    #         elif validation.name == "investmentcost_per_power_undefined":
    #             self.assertEqual(len(validation.errors), 1)
    #         elif validation.name == "asset_power_undefined":
    #             self.assertEqual(len(validation.errors), 7)
    #         elif validation.name == "heatpump_cop_undefined":
    #             self.assertEqual(len(validation.errors), 1)
    #         elif validation.name == "tank_storage_capacity_undefined":
    #             self.assertEqual(len(validation.errors), 1)
    #         elif validation.name == "consumer_profile_undefined":
    #             self.assertEqual(len(validation.errors), 1)
    #         elif validation.name == "consumer_profile_not_null":
    #             self.assertEqual(len(validation.errors), 1)
    #         elif validation.name == "connected_prim_sec":
    #             self.assertEqual(len(validation.errors), 1)
    #         elif validation.name == "connected_prim_sec_return":
    #             self.assertEqual(len(validation.errors), 1)
    #         else:
    #             if 'errors' in validation.__dict__.keys():
    #                 self.assertEqual(len(validation.errors), 3)
    #             elif 'warnings' in validation.__dict__.keys():
    #                 self.assertEqual(len(validation.warnings), 0)

    #     for validation in result2.schemas[0].validations:
    #         if validation.name == 'heat_carriers':
    #             self.assertEqual(len(validation.errors),1)
    #         elif validation.name == "unconnected_port":
    #             self.assertEqual(len(validation.warnings), 4)
    #         elif validation.name == "supply_return_combination":
    #             self.assertEqual(len(validation.errors), 10)
    #         else:
    #             if 'errors' in validation.__dict__.keys():
    #                 self.assertEqual(len(validation.errors),0)
    #             elif 'warnings' in validation.__dict__.keys():
    #                 self.assertEqual(len(validation.warnings), 0)