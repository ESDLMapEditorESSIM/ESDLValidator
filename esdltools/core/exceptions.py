
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
    def __init__(self, msg = "Name already exists", statusCode = 409):
        super().__init__(msg, statusCode)

class InvalidJSON(ApiException):    
    def __init__(self, msg = "JSON is invalid", statusCode = 400):
        super().__init__(msg, statusCode)

class NotFound(ApiException):    
    def __init__(self, msg = "Not found", statusCode = 404):
        super().__init__(msg, statusCode)