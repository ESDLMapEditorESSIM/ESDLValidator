class ValidationResults:
    """Result of a validation, this is returned to the user as JSON"""

    def __init__(self, validation, checks):
        self.name = validation["name"]
        self.description = validation["description"]
        self.message = validation["message"]

        results = self.__getResults(checks)
        if validation["type"].lower() is "error":
            self.errors = results
        else:
            self.warnigns = results

    def __getResults(self, checks):
        results = []

        for check in checks:
            if not check.result.ok:
                results.append(check.result.message)

        return results

