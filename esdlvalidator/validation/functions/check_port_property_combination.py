import json

import esdl

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
        result = ""
        connected_ports = 0
        if len(self.value.port) == 2:
            port_larger_T = 0
            port_smaller_T = 0
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

        elif len(self.value.port) == (4 or 5):
            prim_larger_T = 0
            sec_smaller_T = 0
            prim_smaller_T = 0
            sec_larger_T = 0
            for port in self.value.port:
                if isinstance(port.carrier, esdl.HeatCommodity):
                    if len(port.connectedTo) != 0:
                        connected_ports += 1
                        if isinstance(port, esdl.InPort):
                            if 'prim' in port.name.lower():
                                prim_larger_T = port.connectedTo.items[0].carrier.supplyTemperature
                            elif 'sec' in port.name.lower():
                                sec_smaller_T = port.connectedTo.items[0].carrier.returnTemperature
                        elif isinstance(port, esdl.OutPort):
                            if 'prim' in port.name.lower():
                                prim_smaller_T = port.connectedTo.items[0].carrier.returnTemperature
                            elif 'sec' in port.name.lower():
                                sec_larger_T = port.connectedTo.items[0].carrier.supplyTemperature
            if connected_ports == 4:
                if (prim_larger_T == 0 or sec_smaller_T == 0 or prim_smaller_T == 0 or sec_smaller_T == 0):
                    result = ("{} (name: {}) is connected to the wrong ports or carriers have not been added "
                              "properly").format(self.value.id,  self.value.name)
                elif prim_larger_T < prim_smaller_T:
                    result = ("{} (name: {}) primary side is connected wrong, temeprature in should be larger than "
                              "temperatour out").format(self.value.id, self.value.name)
                elif sec_larger_T < sec_smaller_T:
                    result = ("{} (name: {}) secondary side is connected wrong, temeprature out should be larger than "
                              "temperatour in").format(self.value.id, self.value.name)
                if not isinstance(self.value, esdl.HeatPump):
                    if prim_larger_T < sec_larger_T:
                        result = result + ("{} (name: {}) secondary side temperature out should be smaller than "
                                  "primary side temeprature in").format(self.value.id, self.value.name)
            else:
                if prim_larger_T == 0 and prim_smaller_T == 0 and sec_smaller_T == 0 and sec_larger_T == 0:
                    result = ("{} (name: {}) is connected to the wrong ports or carriers have not been added "
                              "properly").format(self.value.id, self.value.name)
                    #no carriers set

        if len(result) > 0:
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

        return CheckResult(True)
