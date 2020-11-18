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

for x in resource.uuid_dict:
    val = resource.uuid_dict[x]
    if isinstance(val, utils.getEsdlClassFromString("asset")):
       print("asset found: " + val.name)

    #print(x)

print(es.name)