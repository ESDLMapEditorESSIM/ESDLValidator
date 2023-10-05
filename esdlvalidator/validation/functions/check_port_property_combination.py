import json

from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "port_property_combination")
class ContainsPortPropertyCombination(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "port_property_combination",
            "Check if an asset is only connected to",
            [
                ArgDefinition("component", "The port component which must be checked", True),
                ArgDefinition("port_type_larger", "The porttype of which the property must be larger than the "
                                                      "port of port_type_smaller",True),
                ArgDefinition("port_type_smaller", "The porttype of which the property must be smaller than the "
                                                      "port of port_type_larger", True),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        msg = {"offending_asset": self.value.id}
        port_larger_T = 0
        port_smaller_T = 0
        result = ""
        connected_ports = 0
        if len(self.value.port) == 2:
            for port in self.value.port:
                if len(port.connectedTo) != 0:
                    connected_ports += 1
                    if port.__class__.__name__ in self.args['port_type_larger']:
                        port_larger = port
                        port_larger_T = port.connectedTo.items[0].carrier.supplyTemperature
                    elif port.__class__.__name__ in self.args['port_type_smaller']:
                        port_smaller = port
                        port_smaller_T = port.connectedTo.items[0].carrier.returnTemperature
            if connected_ports == 2 :
                if (port_larger_T == 0 or port_smaller_T == 0) or port_larger_T<port_smaller_T :
                    result = ("{} (name: {}) is connected to the wrong ports or carriers have not been added "
                              "properly").format(self.value.id,  self.value.name)
                    # as carriers only have return or supply temperature, if wrong carrier, then temperature 0
            else:
                if port_larger_T == 0 and port_smaller_T == 0:
                    result = ("{} (name: {}) is connected to the wrong ports or carriers have not been added "
                              "properly").format(self.value.id, self.value.name)

            if len(result)>0:
                if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                    msg["message"] = result
                    return CheckResult(False, msg)
                else:
                    return CheckResult(False, result)


        return CheckResult(True)
