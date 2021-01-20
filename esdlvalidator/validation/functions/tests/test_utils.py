import unittest

from esdlvalidator.validation.functions import utils


class TestUtils(unittest.TestCase):
    """Tests for function utils"""

    def test_has_attribute(self):
        "Test if has_attribute works with lower case, single values and child values"

        obj = self.get_test_obj()

        actual1 = utils.has_attribute(obj, "value")
        actual2 = utils.has_attribute(obj, "one.value")
        actual3 = utils.has_attribute(obj, "one.two.Three.value")

        self.assertEqual(actual1, True, "value attribute should be there")
        self.assertEqual(actual2, True, "one.value attribute should be there")
        self.assertEqual(actual3, True, "one.two.three.value attribute should be there")

    def test_get_attribute(self):
        "Test if get_attribute works with lower case, single values and child values"

        obj = self.get_test_obj()

        actual1 = utils.get_attribute(obj, "value")
        actual2 = utils.get_attribute(obj, "one.value")
        actual3 = utils.get_attribute(obj, "one.two.three.value")

        self.assertEqual(actual1, 44, "value attribute should be 44")
        self.assertEqual(actual2, 45, "one.value attribute should 45")
        self.assertEqual(actual3, 47, "one.two.three.value attribute should be 47")

    def get_test_obj(self):
        child3 = type("obj", (object,), {"value": 47})
        child2 = type("obj", (object,), {"three": child3, "value": 46})
        child1 = type("obj", (object,), {"Two": child2, "value": 45})
        obj = type("obj", (object,), {"one": child1, "value": 44})
        return obj
