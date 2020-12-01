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
        datasets = {}

        profiles = FunctionFactory.create_select("get", alias="influx_profiles", data=esh.resource, args={"type": "InfluxDBProfile"})
        datasets[profiles.alias] = profiles.result

        profileAvg = FunctionFactory.create_select("avg", alias="profile_avg", data=datasets, args={"dataset": "influx_profiles", "property": "multiplier"})
        datasets[profileAvg.alias] = profileAvg.result

        profileSum = FunctionFactory.create_select("sum", alias="profile_count", data=datasets, args={"dataset": "influx_profiles", "property": "multiplier"})
        print(profileAvg.result)
        print(profileSum.result)
