from lxml import etree

from esdlvalidator.validation.validator_xsd_results import XsdResult


class XsdValidator:
    """Validator to check ESDL against xsd schema"""

    def __init__(self):
        self.xsdDocument = "esdlvalidator/validation/data/esdl.xsd"

    def validate(self, document: str):
        """Validator to check ESDL against xsd schema

        Args:
            document (str): Esdl document as string

        Returns:
            result: XsdResult containing the xsd validation results
        """

        schema = etree.parse(self.xsdDocument)
        xmlschema = etree.XMLSchema(schema)

        version = self.__get_version(schema)
        errors = []

        try:
            parser = etree.XMLParser(ns_clean=True, recover=True, encoding='utf-8')
            parsedDoc = etree.fromstring(document.encode('utf-8'), parser=parser)
        except etree.XMLSyntaxError as e:
            errors.append("Error parsing xsd: {0}".format(e))
            return XsdResult(False, version, errors)

        valid = xmlschema.validate(parsedDoc)
        for error in xmlschema.error_log:
            errors.append("ERROR ON LINE {0}: {1}".format(error.line, error.message))

        result = XsdResult(valid, version, errors)
        return result

    def __get_version(self, schema):
        """Get the ESDL XSD version"""

        root = schema.getroot()
        schemaVersion = root.attrib["{http://www.tno.nl/esdl/version}version"]
        return schemaVersion
