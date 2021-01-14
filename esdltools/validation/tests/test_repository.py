import unittest

from esdltools.core.exceptions import InvalidJSON, NameAlreadyExists, SchemaNotFound
from esdltools.validation.repository import SchemaRepository


class TestRepository(unittest.TestCase):
    """Tests for validation repository"""

    def test_open_db(self):
        """Test if database can or can't be openend"""

        repo = self.getRepo()
        self.assertIsNotNone(repo, "Loaded db is None")

        with self.assertRaises(OSError,):
            SchemaRepository("/location-does-not-exists/mydb.db")

    def test_add_get(self):
        repo = self.getRepo()
        validJSON = "{\"name\": \"test\", \"description\": \"bla\"}"
        validJSON2 = "{\"name\": \"test2\", \"description\": \"bla2\"}"

        expected1 = repo.insert(validJSON)
        expected2 = repo.insert(validJSON2)
        expected3 = repo.get_by_id(expected1)
        expected4 = repo.get_by_name("test")
        expected5 = repo.get_by_ids([1, 2])

        self.assertEqual(1, expected1, "Inserting JSON to TinyDB should have returned id 1")
        self.assertEqual(2, expected2, "Inserting JSON to TinyDB should have returned id 2")
        self.assertEqual("test", expected3["name"], "Retrieved document by ID should have name test")
        self.assertEqual("test", expected4["name"], "Get By name should have returned a schema with name test")
        self.assertEqual(2, len(expected5), "Get By ids should have returned 2 schemas")

        with self.assertRaises(InvalidJSON,):
            repo.insert("{name: test, description: bla}")

        with self.assertRaises(NameAlreadyExists,):
            repo.insert(validJSON)

        with self.assertRaises(SchemaNotFound,):
            repo.get_by_ids([100, 101])

    def test_remove(self):
        repo = self.getRepo()
        validJSON = "{\"name\": \"test_remove\", \"description\": \"bla\"}"
        schemaID = repo.insert(validJSON)

        expected = repo.remove_by_id(schemaID)

        self.assertEqual(schemaID, expected, "remove by id should have returned the removed schema id")

        with self.assertRaises(SchemaNotFound,):
            repo.remove_by_id(schemaID)

    def getRepo(self):
        return SchemaRepository("./testdata/validation_test.db")
