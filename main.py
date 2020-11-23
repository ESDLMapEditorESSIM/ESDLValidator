# Just some testing

from validation.validator import EsdlValidator
from validation.schema import Schema
from validation.repository import SchemaRepository

from esdltools.core.model import esdl
from esdltools.core.model import utils
from esdltools.core.model.esh import EnergySystemHandler

from tinydb import Query


def load_test_esdl():
    with open('testdata/Ameland_energie_2015.esdl', 'r') as file:
        esdlString = file.read()

    esh = EnergySystemHandler()
    esh.load_from_string(esdlString)
    return esh


def print_test_esdl(resource):
    # loop all objects in loaded ESDL
    for uuid in resource.uuid_dict:
        esdlObject = resource.uuid_dict[uuid]
        if isinstance(esdlObject, utils.get_esdl_class_from_string("HeatingDemand")):
            print("HeatingDemand found: " + getattr(esdlObject, "name"))
            ports = getattr(esdlObject, 'port')

            for port in ports.items:
                connectedPorts = getattr(port, "connectedTo")
                for connectedPort in connectedPorts:
                    print("port connected to: " + getattr(connectedPort, "id"))


esh = load_test_esdl()
energySystem = esh.get_energy_system()
print("ESDL {0}".format(energySystem.name))
print_test_esdl(esh.resource)


#typeNme = type(test).__name__
#schema = Schema("My JSON")
#validator = EsdlValidator(schema)
#result = validator.validate("My Data")

#{
#	"name": "Defaul schema",
#	"description": "A default validation schema to test all ESDL models on",
#	"rules": [
#		{
#			"name": "check_asset_id_notnull",
#			"desciption": "Check if all assets have an id",
#			"type": "error"
#			"message": "Asset does not have an id",
#			"expression": [
#				"select",
#				[
#					"==",
#					"type",
#					"Asset"
#				],
#			]
#		}
#	]
#}
