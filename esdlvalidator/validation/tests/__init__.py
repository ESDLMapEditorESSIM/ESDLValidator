
from esdlvalidator.core.esdl import utils
from esdlvalidator.validation.repository import SchemaRepository

with open('./testdata/validation_test.db', 'w') as file:
    file.write("")


def get_test_schema_data(file):
    with open(file, "r") as file:
        schemaData = file.read()

    return schemaData


def get_test_schema_id(schemaData):
    repo = SchemaRepository("./testdata/validation_test.db")
    schemaID = repo.insert(schemaData)
    return repo.get_by_id(schemaID)


def get_test_dataset_ameland():
    esh = utils.get_esh_from_file("testdata/ameland_energie_2015.esdl")
    return esh.resource


def get_test_dataset_hybrid():
    esh = utils.get_esh_from_file("testdata/hybrid_hp_with_pv_storage.esdl")
    return esh.resource


def get_test_xml_string():
    with open("testdata/hybrid_hp_with_pv_storage.esdl", 'r') as file:
        esdlString = file.read()

    return esdlString
