import json

import esdl

from esdlvalidator.validation.functions import utils
from esdlvalidator.validation.functions.function import FunctionFactory, FunctionCheck, FunctionDefinition, \
    ArgDefinition, FunctionType, CheckResult


@FunctionFactory.register(FunctionType.CHECK, "port_property_combination")
class ContainsPortPropertyCombination(FunctionCheck):

    def get_function_definition(self):
        return FunctionDefinition(
            "port_property_combination",
            "Check if an asset is only connected to",
            [
                ArgDefinition("port_type_larger", "The porttype of which the property must be larger than the "
                                                      "port of port_type_smaller",True),
                ArgDefinition("port_type_smaller", "The porttype of which the property must be smaller than the "
                                                      "port of port_type_larger", True),
                ArgDefinition("property_larger", "The property which must be larger on port_type_larger", True),
                ArgDefinition("property_smaller", "The property which must be smaller on port_type_smaller", True),
                ArgDefinition("port_name_larger", "A string that must be part of the port name for the port with the "
                                                  "larger property", False),
                ArgDefinition("port_name_smaller", "A string that must be part of the port name for the port with "
                                                     "the smaller property", False),
                ArgDefinition("resultMsgJSON", "Display output in JSON format", False)
            ]
        )

    def before_execute(self):
        pass

    def execute(self):
        msg = {"offending_asset": self.value.id}
        result = ""
        connected_ports = 0
        carriers_exists = 0
        attributes_exists = 0

        port_type_larger = getattr(esdl, self.args['port_type_larger'])
        port_type_smaller = getattr(esdl, self.args['port_type_smaller'])

        if len(self.value.port) !=0:
            value_larger = 0
            value_smaller = 0
            for port in self.value.port:
                if len(port.connectedTo) != 0:
                    connected_ports += 1
                    if isinstance(port, port_type_larger):
                        new_obj = port
                        bool_name = True
                        if 'port_name_larger' in self.args:
                            if self.args['port_name_larger'] not in port.name.lower():
                                bool_name = False
                        if bool_name == True:
                            for arg in self.args["property_larger"]:
                                new_obj = utils.get_attribute(new_obj, arg)
                                if arg == self.args["property_larger"][-1]:
                                    value_larger = new_obj
                                    attributes_exists += 1
                                if arg == None:
                                    continue
                    elif isinstance(port, port_type_smaller):
                        new_obj = port
                        bool_name = True
                        if 'port_name_smaller' in self.args:
                            if self.args['port_name_smaller'] not in port.name.lower():
                                bool_name = False
                        if bool_name == True:
                            for arg in self.args["property_smaller"]:
                                new_obj = utils.get_attribute(new_obj, arg)
                                if arg == self.args["property_smaller"][-1]:
                                    value_smaller = new_obj
                                    attributes_exists += 1
                                if arg == None:
                                    continue
            if connected_ports != 1:
                if attributes_exists != 2:
                    result = (f"{self.value.id} (name: {self.value.name}) does not have the carriers properly assigned, set carriers again")
                elif (value_larger == 0 or value_smaller == 0) or value_larger < value_smaller :
                    port_name_smaller_value = self.args['port_name_smaller'] if 'port_name_smaller' in self.args else ''
                    port_name_larger_value = self.args['port_name_larger'] if 'port_name_larger' in self.args else ''
                    result = (f"{self.value.id} (name: {self.value.name}) is connected to the wrong ports or carriers "
                              f"have not been added properly. The {self.args['property_smaller'][-1]} of "
                              f"{self.args['port_type_smaller']} {port_name_smaller_value} should be smaller than the "
                              f"{self.args['property_larger'][-1]} of {self.args['port_type_larger']} "
                              f"{port_name_larger_value}")
                    # as carriers only have return or supply temperature, if wrong carrier, then temperature 0
            else:
                if value_larger == 0 and value_smaller == 0:
                    result = ("{} (name: {}) is connected to the wrong ports or carriers have not been added "
                              "properly").format(self.value.id, self.value.name)

        if len(result) > 0:
            if 'resultMsgJSON' in self.args and self.args['resultMsgJSON']:
                msg["message"] = result
                return CheckResult(False, msg)
            else:
                return CheckResult(False, result)

        return CheckResult(True)
