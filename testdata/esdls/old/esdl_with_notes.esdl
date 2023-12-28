<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" description="" name="" esdlVersion="v2102" version="4" id="8aea11d0-36f1-4971-8969-f1ec515f46f5">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="e955fb65-35e7-485a-bfa8-790c3e1a1915">
    <notes xsi:type="esdl:Notes" id="cc47c4ab-fdee-4a2c-a794-c1b1968d50b8">
      <note xsi:type="esdl:Note" id="44266985-aa20-4525-928a-a2ff10a26d98" author="arun.subramanian@tno.nl" text="text-is-here" title="title-is-here" date="2021-02-11T22:20:00.000000">
        <mapLocation xsi:type="esdl:Point" lat="52.14105063442633" lon="4.883594512939454"/>
      </note>
    </notes>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="7007bed9-7c90-4d43-8356-f9104a45bacf" name="Untitled instance">
    <area xsi:type="esdl:Area" id="4dd9d71e-36d5-44ab-b7ae-c3c97c29bfb5" name="Untitled area">
      <asset xsi:type="esdl:Pipe" outerDiameter="0.225" innerDiameter="0.1325" length="1847.4935225032118" name="Pipe_cb00" id="cb0047a2-5da1-4a96-8727-cb67244f5539">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.14284221687943" lon="4.88170623779297"/>
          <point xsi:type="esdl:Point" lat="52.12703271638364" lon="4.890031814575196"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="5214c671-73eb-4159-91dd-ec6caac72096" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03925">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="b32a1852-1be9-4f2e-ae9d-7633f2765d4c" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0034">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="4b9ca93a-f8ed-40a5-96ac-e58bbf6c972b" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="264015c6-e7ed-4bfe-b404-97ae08f7f63c" name="In"/>
        <port xsi:type="esdl:OutPort" id="5ed3c0a0-cd3a-4e8f-873a-6e3abbffb9ad" name="Out"/>
      </asset>
      <asset xsi:type="esdl:PVPark" surfaceArea="1322970" name="PVPark_7286" id="72863e97-48a6-42b9-8047-a31f5b418dd7">
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="52.1385729949764" lon="4.854154586791993"/>
            <point xsi:type="esdl:Point" lat="52.13883646437156" lon="4.8752689361572275"/>
            <point xsi:type="esdl:Point" lat="52.128665414740034" lon="4.869432449340821"/>
            <point xsi:type="esdl:Point" lat="52.12998303913364" lon="4.853811264038087"/>
          </exterior>
        </geometry>
        <port xsi:type="esdl:OutPort" id="8921c3f5-f7ca-464a-89e4-7692dc0d87a0" name="Out"/>
        <port xsi:type="esdl:InPort" id="4b14f58f-29fa-4bfd-bfb0-8ceef8b812bd" name="In"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" name="GasProducer_25ed" id="25eded75-805f-43aa-8b0f-7e5d6f316bef">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.14442408905281" lon="4.86771583557129"/>
        <port xsi:type="esdl:OutPort" id="cfea8676-29bd-45dd-b076-51f11d2fdb26" name="Out"/>
        <port xsi:type="esdl:InPort" id="9ff204c8-f63d-4ed7-a506-6370c8ba83e4" name="In"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
