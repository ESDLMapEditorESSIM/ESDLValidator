import unittest
import json

from esdltools.core.esdl.esh import EnergySystemHandler
from esdltools.validation.functions.function import FunctionFactory


class TestSelect(unittest.TestCase):
    """Tests for select functions"""

    def test_select(self):
        """Test if get_esdl_class_from_string returns the correct classes and exceptions"""

        with open('testdata/Ameland_energie_2015.esdl', 'r') as file:
            esdlString = file.read()

        esh = EnergySystemHandler()
        esh.load_from_string(esdlString)

        hdGet = FunctionFactory.create_select("get", alias="heating_demands", data=esh.resource, args={"type": "HeatingDemand"})

        for value in hdGet.result:
            print("HeatingDemand found: " + getattr(value, "name"))

        #InfluxDBProfile
        profiles = FunctionFactory.create_select("get", alias="influx_profiles", data=esh.resource, args={"type": "InfluxDBProfile"})
        profileAvg = FunctionFactory.create_select("avg", alias="profile_avg", data=profiles.result, args={"property": "multiplier"})
        profileCount = FunctionFactory.create_select("sum", alias="profile_count", data=profiles.result, args={"property": "multiplier"})
        print(profileAvg.result)
        print(profileCount.result)
        #self.assertEqual(schema["name"], "Schema test 1", "Name of loaded schema was unexpected")
        #self.assertEqual(schema["rules"][0]["name"], "check_asset_id_notnull", "Class string casing should be ignored and return esdl.Asset")
