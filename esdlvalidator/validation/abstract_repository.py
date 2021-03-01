from abc import ABC


class SchemaRepository(ABC):

    def get_all(self):
        # return list([dict])
        pass

    def get_by_id(self, id: int):
        # return dict
        pass

    def get_by_ids(self, ids: list):
        # return list([dict])
        pass

    def get_by_name(self, name: str):
        # return dict
        pass

    def insert(self, jsonString: str):
        # return ID
        pass

    def remove_by_id(self, id: int):
        # return dict
        pass

    def update(self, id: int, jsonString: str):
        # return ID
        pass
