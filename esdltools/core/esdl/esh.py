#  This work is based on original code developed and copyrighted by TNO 2020.
#  Subsequent contributions are licensed to you by the developers of such code and are
#  made available to the Project under one or several contributor license agreements.
#
#  This work is licensed to you under the Apache License, Version 2.0.
#  You may obtain a copy of the license at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Contributors:
#      TNO         - Initial implementation
#  Manager:
#      TNO

import uuid
import logging

from io import BytesIO

from pyecore.resources import ResourceSet, URI
from pyecore.resources import ResourceSet, URI
from pyecore.utils import alias

from esdltools.core.esdl.resources.xmlresource import XMLResource
from esdltools.core.esdl import esdl

log = logging.getLogger(__name__)


class EnergySystemHandler:

    def __init__(self):
        self.rset = None
        self.resource = None
        self.energy_system = None

        self._new_resource_set()

        esdl.ProfileElement.from_.name = 'from'
        setattr(esdl.ProfileElement, 'from', esdl.ProfileElement.from_)
        alias('start', esdl.ProfileElement.from_)

        #esdl.FromToIntPerc.from_.name = 'from'
        #setattr(esdl.FromToIntPerc, 'from', esdl.FromToIntPerc.from_)
        #alias('start', esdl.FromToIntPerc.from_)

        #esdl.FromToDoublePerc.from_.name = 'from'
        #setattr(esdl.FromToDoublePerc, 'from', esdl.FromToDoublePerc.from_)
        #alias('start', esdl.FromToDoublePerc.from_)

    def _new_resource_set(self):
        self.rset = ResourceSet()
        self._set_resource_factories()

    def _set_resource_factories(self):
        # Assign files with the .esdl extension to the XMLResource instead of default XMI
        self.rset.resource_factory['esdl'] = XMLResource
        self.rset.resource_factory['*'] = XMLResource

    def load_from_string(self, esdl_string, name='from_string'):
        """Loads an energy system from a string and adds it to a *new* resourceSet
        :returns the loaded EnergySystem """
        uri = StringURI(name+'.esdl', esdl_string)
        self._new_resource_set()
        self.resource = self.rset.create_resource(uri)
        try:
            self.resource.load()
            self.energy_system = self.resource.contents[0]
            return self.resource
        except Exception as e:
            log.error("Exception when loading resource: {}: {}".format(name, e))
            raise

    def get_energy_system(self):
        return self.energy_system


class StringURI(URI):
    def __init__(self, uri, text=None):
        super(StringURI, self).__init__(uri)
        if text is not None:
            self.__stream = BytesIO(text.encode('UTF-8'))

    def getvalue(self):
        readbytes = self.__stream.getvalue()
        # somehow stringIO does not work, so we use BytesIO
        string = readbytes.decode('UTF-8')
        return string

    def create_instream(self):
        return self.__stream

    def create_outstream(self):
        self.__stream = BytesIO()
        return self.__stream

    def get_stream(self):
        return self.__stream