class ValidationResults:
    """Result of a validation, this is returned to the user as JSON"""

    def __init__(self, validation, checks):
        results = self.__getResults(checks, validation["message"])

        self.name = validation["name"]
        self.description = validation["description"]
        self.checked = len(checks)

        if validation["type"].lower() is "error":
            self.errors = results
        else:
            self.warnings = results


    def __getResults(self, checks, message):
        results = []

        for check in checks:
            if not check.result.ok:
                results.append("{0}: {1}".format(message, check.result.message))

        return results

