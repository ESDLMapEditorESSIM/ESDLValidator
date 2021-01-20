import unittest
import json
import types

from esdlvalidator.core.esdl import utils
from esdlvalidator.core.esdl.esh import EnergySystemHandler
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionType


class TestFunctionCheck(unittest.TestCase):
    """Tests for check functions"""

    # for each value in dataset run check
    # get dataset from json
    # loop over entries
    # create and run check
    # "check": { "dataset": "heating_demands", "function": "contains", "args": {"property": "name"} }

    def test_check_not_null(self):
        """Test if get_esdl_class_from_string returns the correct classes and exceptions"""

        datasets = self.get_test_datasets()
        hdGet = FunctionFactory.create(FunctionType.SELECT, "get", alias="heating_demands", datasets=datasets, args={"type": "HeatingDemand"})
        ghGet = FunctionFactory.create(FunctionType.SELECT, "get", alias="gas_heaters", datasets=datasets, args={"type": "GasHeater"})

        heatingDemandNameNullCount = 0
        for entry in hdGet.result:
            check = FunctionFactory.create(FunctionType.CHECK, "not_null", datasets=datasets, value=entry, args={"property": "name"})
            if not check.result.ok:
                heatingDemandNameNullCount += 1

        powerNullCount = 0
        for entry in ghGet.result:
            check = FunctionFactory.create(FunctionType.CHECK, "not_null", datasets=datasets, value=entry, args={"property": "power", "counts_as_null": [0, 0.0]})
            if not check.result.ok:
                powerNullCount += 1

        self.assertEqual(heatingDemandNameNullCount, 1, "There should be one HeatingDemand with no name set")
        self.assertEqual(powerNullCount, 1, "There should be 1 power with a null value (0.0)")

    def get_test_datasets(self):
        esh = utils.get_esh_from_file("testdata/ameland_energie_2015.esdl")
        return {"resource": esh.resource}
