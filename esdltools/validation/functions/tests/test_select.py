import unittest
import json

from esdltools.core.esdl import utils
from esdltools.core.esdl.esh import EnergySystemHandler
from esdltools.validation.functions.function import FunctionFactory


class TestSelect(unittest.TestCase):
    """Tests for select functions"""

    def test_select(self):
        """Test if get_esdl_class_from_string returns the correct classes and exceptions"""

        esh = utils.get_esh_from_file("testdata/Ameland_energie_2015.esdl")
        hdGet = FunctionFactory.create_select("get", alias="heating_demands", data=esh.resource, args={"type": "HeatingDemand"})

        for value in hdGet.result:
            print("HeatingDemand found: " + getattr(value, "name"))

        data = {}
        profiles = FunctionFactory.create_select("get", alias="influx_profiles", data=esh.resource, args={"type": "InfluxDBProfile"})
        data[profiles.alias] = profiles.result
        profileAvg = FunctionFactory.create_select("avg", alias="profile_avg", data=data, args={"dataset": "influx_profiles", "property": "multiplier"})
        data[profileAvg.alias] = profileAvg.result
        profileSum = FunctionFactory.create_select("sum", alias="profile_count", data=data, args={"dataset": "influx_profiles", "property": "multiplier"})
        print(profileAvg.result)
        print(profileSum.result)
