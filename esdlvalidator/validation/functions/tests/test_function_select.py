import unittest
import json
import types

from esdlvalidator.core.esdl import utils
from esdlvalidator.core.esdl.esh import EnergySystemHandler
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionType


class TestFunctionSelect(unittest.TestCase):
    """Tests for select functions"""

    def test_select_get(self):
        """Test if the select function 'get' is working"""

        datasets = self.get_test_datasets()
        hdGet = FunctionFactory.create(FunctionType.SELECT, "get", alias="heating_demands", datasets=datasets, args={"type": "HeatingDemand"})
        profiles = FunctionFactory.create(FunctionType.SELECT, "get", alias="influx_profiles", datasets=datasets, args={"type": "InfluxDBProfile"})

        self.assertEqual(len(hdGet.result), 21, "select get function should return 21 HeatingDemands")
        self.assertEqual(len(profiles.result), 44, "select get function should return 10 Profiles")

    def test_select_sum(self):
        """Test if the sum function is working"""

        datasets = self.get_test_datasets()
        profiles = FunctionFactory.create(FunctionType.SELECT, "get", alias="influx_profiles", datasets=datasets, args={"type": "InfluxDBProfile"})
        datasets[profiles.alias] = profiles.result
        profileSum = FunctionFactory.create(FunctionType.SELECT, "sum", alias="profile_count", datasets=datasets, args={"dataset": "influx_profiles", "property": "multiplier"})

        self.assertEqual(profileSum.result, 542.0799999999999, "Sum of all profile multipliers should be 542.0799999999999")

    def test_select_avg(self):
        """Test if the sum function is working"""

        datasets = self.get_test_datasets()
        profiles = FunctionFactory.create(FunctionType.SELECT, "get", alias="influx_profiles", datasets=datasets, args={"type": "InfluxDBProfile"})
        datasets[profiles.alias] = profiles.result
        profileAvg = FunctionFactory.create(FunctionType.SELECT, "avg", alias="profile_count", datasets=datasets, args={"dataset": "influx_profiles", "property": "multiplier"})

        self.assertEqual(profileAvg.result, 12.319999999999999, "Avg profile multiplier should be")

    def test_select_filter_has_property(self):
        """Test if selecting a subset based on containg property is working"""

        datasets = self.get_test_datasets()
        assets = FunctionFactory.create(FunctionType.SELECT, "get", alias="assets", datasets=datasets, args={"type": "Asset"})
        datasets[assets.alias] = assets.result

        filtered = FunctionFactory.create(FunctionType.SELECT, "filter_has_property", alias="subselect", datasets=datasets, args={"dataset": "assets", "property": "costinformation.marginalcosts"})

        self.assertEqual(len(assets.result), 79, "There should be 100 assets")
        self.assertEqual(len(filtered.result), 2, "There should be 2 filtered")

    def test_select_get_references(self):
        """Test if getting assets inside a assets work"""

        datasets = self.get_test_dataset2()
        assets = FunctionFactory.create(FunctionType.SELECT, "get_references", alias="areas", datasets=datasets, args={"assetType": "Area", "referenceType": "ResidualHeatSource"})
        datasets[assets.alias] = assets.result

        self.assertEqual(len(assets.result), 528, "There should be 528 ResidualHeatSources")

    def test_select_children(self):
        """Test if function select children selects all the children from a dataset"""

        dataset = self.get_test_dataset2()
        areas = FunctionFactory.create(FunctionType.SELECT, "get", alias="areas", datasets=dataset, args={"type": "Area"})
        dataset[areas.alias] = areas.result

        allAssets = FunctionFactory.create(FunctionType.SELECT, "get", alias="assets", datasets=dataset, args={"type": "Asset"})
        dataset[allAssets.alias] = allAssets.result

        children = FunctionFactory.create(FunctionType.SELECT, "select_children", alias="heatsources", datasets=dataset, args={"dataset": "areas", "type": "Asset"})

        self.assertEqual(len(children.result), 555, "There should only be 555 assets")
        self.assertNotEqual(len(allAssets.result), len(children.result), "There should not be the same amount of assets and area children assets")

    def get_test_datasets(self):
        esh = utils.get_esh_from_file("testdata/ameland_energie_2015.esdl")
        return {"resource": esh.resource}

    def get_test_dataset2(self):
        esh = utils.get_esh_from_file("testdata/buurt_maatregelen.esdl")
        return {"resource": esh.resource}
