
from esdlvalidator.core.esdl import utils
from esdlvalidator.validation.file_repository import FileSchemaRepository

# with open('./testdata/validation_test.db', 'w') as file:
#     file.write("")


def get_test_schema_data(file):
    with open(file, "r") as file:
        schemaData = file.read()

    return schemaData


def get_test_schema_id(schemaData):
    repo = FileSchemaRepository("C:/git/chess-preprocessor/testdata/validation_test.db")
    schemaID = repo.insert(schemaData)
    return repo.get_by_id(schemaID)


def get_test_dataset_ameland():
    esh = utils.get_esh_from_file("C:/git/chess-preprocessor/testdata/ameland_energie_2015.esdl")
    return esh.resource


def get_test_dataset_hybrid():
    esh = utils.get_esh_from_file("C:/git/chess-preprocessor/testdata/hybrid_hp_with_pv_storage.esdl")
    return esh.resource

def get_test_dataset_3B_bad():
    esh = utils.get_esh_from_file("C:/git/chess-preprocessor/testdata/3B_bad.esdl")
    return esh.resource

def get_test_dataset_PoC():
    esh = utils.get_esh_from_file("C:/git/chess-preprocessor/testdata/PoC_validator with return network.esdl")
    return esh.resource
