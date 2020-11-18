#import ast

from validation.validator import EsdlValidator
from validation.schema import Schema

from model import esdl
from model import utils
from model.esh import EnergySystemHandler

#schema = Schema("My JSON")
#validator = EsdlValidator(schema)
#result = validator.validate("My Data")
#print(result)

with open('testdata/Ameland_energie_2015.esdl', 'r') as file:
    esdl_string = file.read()

esh = EnergySystemHandler()
resource = esh.load_from_string(esdl_string)
es = esh.get_energy_system()
instance = getattr(es, 'instance')
test = instance[0]
typeNme = type(test).__name__

# loop all objects in loaded ESDL
for x in resource.uuid_dict:
    val = resource.uuid_dict[x]
    if isinstance(val, utils.get_esdl_class_from_string("HeatingDemand")):
        print("HeatingDemand found: " + getattr(val, "name"))
        ports = getattr(val, 'port')

        for p in ports.items:
            connectedPorts = getattr(p, "connectedTo")
            for connectedPort in connectedPorts:
                print("port connected to: " + getattr(connectedPort, "id"))

    #print(x)

print(es.name)
