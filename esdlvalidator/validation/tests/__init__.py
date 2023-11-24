
from esdlvalidator.core.esdl import utils
from esdlvalidator.validation.file_repository import FileSchemaRepository

from pathlib import Path

with open(Path.joinpath(Path(__file__).parents[3], "testdata/validation_test.db"), 'w') as file:
    file.write("")


def get_test_schema_data(file):
    with open(file, "r") as file:
        schemaData = file.read()

    return schemaData


def get_test_schema_id(schemaData):
    # repo = FileSchemaRepository("./testdata/validation_test.db")
    repo = FileSchemaRepository(Path.joinpath(Path(__file__).parents[3], "testdata/validation_test.db"))
    schemaID = repo.insert(schemaData)
    return repo.get_by_id(schemaID)


def get_test_dataset_ameland():
    esh = utils.get_esh_from_file(Path.joinpath(Path(__file__).parents[3], "testdata/ameland_energie_2015.esdl"))
    return esh.resource


def get_test_dataset_hybrid():
    esh = utils.get_esh_from_file(Path.joinpath(Path(__file__).parents[3], "testdata/hybrid_hp_with_pv_storage.esdl"))
    return esh.resource

def get_test_dataset_3B_bad():
    esh = utils.get_esh_from_file(Path.joinpath(Path(__file__).parents[3], "testdata/3B_bad.esdl"))
    return esh.resource

def get_test_dataset_PoC():
    esh = utils.get_esh_from_file(Path.joinpath(Path(__file__).parents[3], "testdata/PoC_validator with return network.esdl"))
    # esh = utils.get_esh_from_file(r"C:\Users\janssenfpjh\Downloads\New Energy System with return network (1).esdl")
    # esh = utils.get_esh_from_file(r"C:\Users\janssenfpjh\Downloads\lkj with return network.esdl")
    # esh = utils.get_esh_from_file(r"C:\Users\janssenfpjh\Downloads\WBr Moerdijk 2clean_carrier_duplicate.esdl")
    # esh = utils.get_esh_from_file(r"C:\Users\janssenfpjh\Downloads\WBr Moerdijk 2clean.esdl")
    # esh = utils.get_esh_from_file(r"C:\Users\janssenfpjh\Downloads\WBr Moerdijk 2clean2.esdl")
    return esh.resource

def get_test_dataset_single_pipes():
    esh = utils.get_esh_from_file(
        Path.joinpath(Path(__file__).parents[3], "testdata/Single_pipes.esdl"))
    return esh.resource
