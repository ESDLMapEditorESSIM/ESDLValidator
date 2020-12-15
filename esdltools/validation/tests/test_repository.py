import unittest
import json

from esdltools.validation.repository import SchemaRepository

class TestRepository(unittest.TestCase):
    """Tests for validation repository"""

    def test_open_db(self):
        """Test if database can or can't be openend"""

        repo = self.getRepo()
        self.assertIsNotNone(repo, "Loaded db is None")

        with self.assertRaises(OSError,):
           SchemaRepository("./testdata/validation_test_does_not_exist.db")

    def test_add_get(self):
        repo = self.getRepo()
        validJSON = "{\"name\": \"test\", \"description\": \"bla\"}"
        expected = repo.insert(validJSON)
        expected1 = repo.get_by_id(expected)
        expected2 = repo.get_by_name("test")

        self.assertEqual(1, expected, "Inserting JSON to TinyDB should have returned id 1")
        self.assertEqual("test", expected1["name"], "Retrieved document by ID should have name test")
        self.assertEqual("test", expected2["name"], "Get By name should have returned a schema with name test")

        with self.assertRaises(ValueError,):
            repo.insert("{name: test, description: bla}");

        with self.assertRaises(ValueError,):
            repo.insert(validJSON);
    
    def test_remove(self):
        repo = self.getRepo()
        validJSON = "{\"name\": \"test_remove\", \"description\": \"bla\"}"
        schemaID = repo.insert(validJSON)
        
        expected1 = repo.remove_by_id(schemaID)
        expected2 = repo.remove_by_id(schemaID)

        self.assertEqual(schemaID, expected1, "remove by id should have returned the removed schema id")
        self.assertEqual(None, expected2, "remove by id should have returned None since the schema was already removed")

    def getRepo(self):
        return SchemaRepository("./testdata/validation_test.db")
