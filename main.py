# Just some testing

from esdltools.core.esdl import esdl
from esdltools.core.esdl import utils
from esdltools.core.esdl.esh import EnergySystemHandler

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
        if issubclass(type(esdlObject), utils.get_esdl_class_from_string("HeatingDemand")):
            print("HeatingDemand found: " + getattr(esdlObject, "name"))
            ports = getattr(esdlObject, 'port')

            for port in ports.items:
                name = getattr (port, "name")
                id = getattr(port, "id")
                connectedPorts = getattr(port, "connectedTo")
                for connectedPort in connectedPorts:
                    print("port {0} {1} connected to: {2}".format(name, id, getattr(connectedPort, "id")))
        elif issubclass(type(esdlObject), utils.get_esdl_class_from_string("GenericProducer")):
            power = getattr(esdlObject, 'power')
            costinfo = getattr(esdlObject, 'costInformation')
            if costinfo:
                marginalcosts = getattr(costinfo, 'marginalCosts')
                if marginalcosts:
                    marginalcosts = getattr(marginalcosts, 'value')
                else:
                    marginalcosts = 0
            else:
                marginalcosts = 0
            ports = getattr(esdlObject, 'port')
            hasProfile = 0
            for port in ports.items:
                name = getattr(port, "name")
                id = getattr(port, "id")
                profile = getattr(port, "profile")
                if name == 'Out':
                    hasProfile = len(profile.items)
            print("producer, power: {0}, marginalcosts: {1}, profile: {2}".format(power, marginalcosts,hasProfile))
        elif issubclass(type(esdlObject), utils.get_esdl_class_from_string("Conversion")):
            power = getattr(esdlObject, 'power')
            hasControlStrategy = False
            controlStrategy = getattr(esdlObject, 'controlStrategy')
            if controlStrategy:
                hasControlStrategy = True
            ports = getattr(esdlObject, 'port')
            portcount = len(ports)
            carriercount = 0
            for port in ports.items:
                carrier = getattr(port, 'carrier')
                if (carrier):
                    carriercount += 1
            print("Conversion, power: {0}, hasControlStrategy: {1}, portcount == carriercount: {2}".format(power, hasControlStrategy, (portcount == carriercount)))



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
#			"selects": [
#               {
#                   "alias": "producers",
#                   "function": "get",
#                   "args": {
#                       "type": "producer",
#                   }
#               }
#			],
#           "test": {
#           }
#		}
#	]
#}

# select_function -> get, sum, avg, min, max -> returns 1 value or list which can be used in other selects and tests
# test_function -> null, not_null, equals, greater_than, smaller_than -> returns true/false
# filter_function

# "select": { 
#   "alias": "producers",
#   "function": "get",
#   "args": {
#       "type": "producer",
#   }
# }
# "select": {
#   "alias": "powers_avg",
#   "function": "avg",
#   "args": {
#       "value": "producers"
#       "property": "power.minimum",
#   }
# }
# "test": { 
#   "value": "producers"
#   "function": "not_null"
#   "dataset": "producers"
#   "args": { 
#       "property": "power"
#   },
#   "and": [
#       {
#           "function": "not_null"
#           "args": {
#               "property": "power"
#            }
#       }
#   ],
#   "or": [
#       
#   ]
# }


# select(as, args(alias), prvious)
# calculate()
