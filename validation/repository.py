from tinydb import TinyDB, Query


class SchemaRepository:

    def __init__(self, location):
        self.db = TinyDB(location)
        self.table = self.db.table("schema")
        # self._insert_test()

    def get_all(self):
        return self.table.all()

    def get_by_id(self, id):
        return self.table.get(doc_id=id)

    def _insert_test(self):
        self.table.insert({"name": "test", "description": "ikel"})
        self.table.insert({"name": "test2", "description": "ikel2"})
