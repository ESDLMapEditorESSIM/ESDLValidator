from esdlvalidator.validation.functions import utils


class EsdlValidationResults:
    """Result of a validation, this is returned to the user as JSON"""

    def __init__(self, validation, checks):
        msg = utils.get_attribute(validation, "message", "No message defined")

        results = self.__getResults(checks, msg)
        self.name = utils.get_attribute(validation, "name", "No name given")
        self.description = utils.get_attribute(validation, "description", "No description given")
        self.checked = len(checks)

        if validation["type"].lower() == "error":
            self.errors = results
        else:
            self.warnings = results

    def __getResults(self, checks, message):
        results = []

        for check in checks:
            if not check.result.ok:
                results.append("{0}: {1}".format(message, check.result.message))

        return results
