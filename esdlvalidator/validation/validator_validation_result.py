from esdlvalidator.validation.functions import utils


class ValidationResults:
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

    def __getResults(self, checks: list, message: str):
        results = []

        for check in checks:
            if not check.result.ok:
                if isinstance(check.result.message, dict):
                    if check.result.message.get("message"):
                        check_msg = (
                            check.result.message["message"]
                            if type(check.result.message["message"]) == list
                            else [check.result.message["message"]]
                        )

                        check.result.message["message"] = {
                            "validation_message": message,
                            "check_result_message": check_msg,
                        }
                    results.append(check.result.message)
                else:
                    results.append("{0}: {1}".format(message, str(check.result.message)))

        return results
