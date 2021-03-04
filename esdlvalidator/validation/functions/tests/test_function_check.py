import unittest

from esdlvalidator.core.esdl import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionType


class TestFunctionCheck(unittest.TestCase):
    """Tests for check functions"""

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

    def test_check_in_range(self):
        datasets = self.get_test_datasets()
        assets = FunctionFactory.create(FunctionType.SELECT, "get", alias="assets", datasets=datasets, args={"type": "Asset"})
        datasets[assets.alias] = assets.result

        filtered = FunctionFactory.create(FunctionType.SELECT, "filter_has_property", alias="subselect", datasets=datasets, args={"dataset": "assets", "property": "costinformation.marginalcosts"})

        okCount = 0
        notOkCount = 0

        for entry in filtered.result:
            check = FunctionFactory.create(FunctionType.CHECK, "in_range", datasets=datasets, value=entry, args={"property": "costInformation.marginalCosts.value", "min": 0, "max": 1})
            if not check.result.ok:
                notOkCount += 1
            else:
                okCount += 1

        self.assertEqual(okCount, 1, "There should be 1 cost in range")
        self.assertEqual(notOkCount, 1, "There should be 1 not in range")

    def test_check_is_type(self):
        datasets = self.get_test_datasets()
        assets = FunctionFactory.create(FunctionType.SELECT, "get", alias="assets", datasets=datasets, args={"type": "Asset"})
        datasets[assets.alias] = assets.result

        okCount = 0
        notOkCount = 0

        for entry in assets.result:
            check = FunctionFactory.create(FunctionType.CHECK, "is_type", value=entry, datasets=datasets, args={"dataset": "assets", "type": "HeatingDemand"})
            if not check.result.ok:
                notOkCount += 1
            else:
                okCount += 1

        self.assertEqual(okCount, 21, "There should be 21 asset of type HeatingDemand")
        self.assertEqual(notOkCount, 58, "There should be 58 not of type HeatingDemand")

    def test_check_has_children(self):
        datasets = self.get_test_datasets()
        assets = FunctionFactory.create(FunctionType.SELECT, "get", alias="gasheaters", datasets=datasets, args={"type": "Asset"})
        datasets[assets.alias] = assets.result

        okCount = 0
        notOkCount = 0

        for entry in assets.result:
            check = FunctionFactory.create(FunctionType.CHECK, "has_child", value=entry, datasets=datasets, args={"type": "geometry"})
            if not check.result.ok:
                notOkCount += 1
            else:
                okCount += 1

        self.assertEqual(okCount, 78, "There should be 7 assets with a geometry")
        self.assertEqual(notOkCount, 1, "There should be 1 gasheaters without a geometry")

    def get_test_datasets(self):
        esh = utils.get_esh_from_file("testdata/ameland_energie_2015.esdl")
        return {"resource": esh.resource}
