from esdlvalidator.core.esdl import utils as esdlUtils

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionSelect, FunctionDefinition, ArgDefinition, FunctionType


@FunctionFactory.register(FunctionType.SELECT, "get_references")
class SelectGet(FunctionSelect):

    def get_function_definition(self):
        return FunctionDefinition(
            "get_references",
            "Get a list of references of certain entities from loaded ESDL data",
            [
                ArgDefinition("assetType", "type name of entities to retrieve, this can be a superclass. i.e. Port returns InPort, OutPort...", True),
                ArgDefinition("referenceType", "type name of entities to retrieve, this can be a superclass. i.e. Port returns InPort, OutPort...", True)
            ]
        )

    def execute(self):
        dataset = self.datasets.get("resource")
        assetType = utils.get_attribute(self.args, "assetType")
        referenceType = utils.get_attribute(self.args, "referenceType")
        assets = esdlUtils.get_entities_from_esdl_resource_by_type(dataset, assetType)
        entities = esdlUtils.get_references_from_assets_by_type(assets, referenceType)

        return entities
