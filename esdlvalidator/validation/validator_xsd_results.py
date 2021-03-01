import json


class XsdResult:
    """Result of an ESDL file validation against the xsd"""

    def __init__(self, valid, version, errors):
        self.valid = valid
        self.version = version
        self.errors = errors

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__, sort_keys=False, indent=4)
