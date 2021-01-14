
class ApiException(Exception):
    """Exception raised for errors in the input salary.

    Attributes:
        message -- explanation of the error
    """

    def __init__(self, message, statusCode):
        self.message = message
        self.statusCode = statusCode
        super().__init__(self.message)


class NameAlreadyExists(ApiException):
    def __init__(self, msg="Name already exists", statusCode=409):
        super().__init__(msg, statusCode)


class InvalidJSON(ApiException):
    def __init__(self, msg="JSON is invalid", statusCode=400):
        super().__init__(msg, statusCode)


class SchemaNotFound(ApiException):
    def __init__(self, msg="Schema not found", statusCode=404):
        super().__init__(msg, statusCode)


class UnknownESDLFileType(ApiException):
    def __init__(self, msg="Unknown file type, expected .esdl or .xml", statusCode=400):
        super().__init__(msg, statusCode)


class InvalidESDL(ApiException):
    def __init__(self, msg="Invalid ESDL: unable to read data as ESDL", statusCode=400):
        super().__init__(msg, statusCode)
