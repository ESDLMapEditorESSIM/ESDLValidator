<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" description="" name="Untitled EnergySystem" id="5ebde9ba-e13e-4250-86d4-df1f05f39b7c">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="5553bd29-b9bc-40f1-9340-534d3cd1c981">
    <carriers xsi:type="esdl:Carriers" id="2a23cde5-b868-4fbf-b8be-7afc87db8853">
      <carrier xsi:type="esdl:GasCommodity" name="gas" id="eb3c5202-8706-458a-8e20-105f96004418"/>
      <carrier xsi:type="esdl:HeatCommodity" name="heat" id="06d528ac-3dfc-44c2-a624-504e3cc2e46f"/>
      <carrier xsi:type="esdl:ElectricityCommodity" name="Electricity" id="7ba9c9db-3360-465c-8560-b3b429447f17"/>
    </carriers>
  </energySystemInformation>
  <services xsi:type="esdl:Services">
    <service xsi:type="esdl:DrivenByDemand" outPort="b67cdfeb-bf43-486c-9414-32f760a00a5f" name="DrivenByDemand for GasHeater_a011" energyAsset="a0114e9d-5bf3-4cd3-adb8-6781e00d78d4" id="94e0bba4-da8b-429e-b017-d6e8a135a291"/>
    <service xsi:type="esdl:DrivenByDemand" outPort="6b88194f-9943-44cc-a3cc-ffe0f19acafe" name="DrivenByDemand for HeatPump_88f1" id="87479c57-bfd2-4303-bd08-058bf1b29eb5"/>
    <service xsi:type="esdl:StorageStrategy" energyAsset="d474f60b-41fc-490a-b52e-198a2e4ff780" id="9e33b513-0adb-4e47-9b21-306d27ed2dca" name="StorageStrategy for Battery_d474">
      <marginalDischargeCosts xsi:type="esdl:SingleValue" value="0.8" name="marginalChargeCosts for Battery_d474" id="5e9b33b6-8f5b-4590-9f7b-01d74cfbe6eb"/>
      <marginalChargeCosts xsi:type="esdl:SingleValue" value="0.2" name="marginalChargeCosts for Battery_d474" id="7ff5672b-03f2-417b-b9e4-28267ba45b4f"/>
    </service>
  </services>
  <instance xsi:type="esdl:Instance" id="7e69908f-b9dd-4edd-b217-eedff0c6ed34" name="Untitled Instance">
    <area xsi:type="esdl:Area" id="6dc247b0-1f3e-46df-80e4-dc1b814f8ec4" name="Untitled Area">
      <asset xsi:type="esdl:GenericProducer" power="100000.0" id="5983a0f8-6f87-47b5-ba31-5e245c370dab" name="GenericProducer_5983">
        <port xsi:type="esdl:OutPort" name="Out" carrier="eb3c5202-8706-458a-8e20-105f96004418" id="6143d6a1-e313-4b56-9ac0-5082f7c5364c" connectedTo="42ee1073-d66c-4f6e-bac0-ab577f0a2169"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="53.28081633409321" lon="5.642852783203126"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.9" power="3200.0" id="a0114e9d-5bf3-4cd3-adb8-6781e00d78d4" controlStrategy="94e0bba4-da8b-429e-b017-d6e8a135a291" name="GasHeater_a011">
        <costInformation xsi:type="esdl:CostInformation">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.5" name="GasHeater_a011-MarginalCosts" id="9675c31e-30d1-4f17-beed-099b69f0bc71"/>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" connectedTo="6143d6a1-e313-4b56-9ac0-5082f7c5364c" carrier="eb3c5202-8706-458a-8e20-105f96004418" id="42ee1073-d66c-4f6e-bac0-ab577f0a2169"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="06d528ac-3dfc-44c2-a624-504e3cc2e46f" id="b67cdfeb-bf43-486c-9414-32f760a00a5f" connectedTo="075cb7d3-9079-4d14-9266-02b8f963fd6c"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="53.28097028666422" lon="5.646629333496095"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="7ffe8a5b-4df0-4212-be8a-d7fc2798ce8c" name="HeatingDemand_7ffe">
        <port xsi:type="esdl:InPort" name="In" connectedTo="b67cdfeb-bf43-486c-9414-32f760a00a5f 6b88194f-9943-44cc-a3cc-ffe0f19acafe" carrier="06d528ac-3dfc-44c2-a624-504e3cc2e46f" id="075cb7d3-9079-4d14-9266-02b8f963fd6c">
          <profile xsi:type="esdl:InfluxDBProfile" port="8086" host="http://influxdb" id="5605e7e3-36b1-49a8-8ffd-47986e384193" measurement="standard_profiles_point" endDate="2019-12-31T22:00:00.000000+0000" filters="" startDate="2018-12-23T23:00:00.000000+0000" field="G1A" database="energy_profiles" multiplier="50.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="eb07bccb-203f-407e-af98-e687656a221d" multiplier="GIGA" physicalQuantity="ENERGY" description="Energy in GJ" unit="JOULE"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="53.28132950717319" lon="5.650062561035156"/>
      </asset>
      <asset xsi:type="esdl:ElectricityNetwork" id="8b22d205-0784-4d3e-9564-3fd8f9838eff" name="ElectricityNetwork_8b22">
        <port xsi:type="esdl:InPort" name="In" connectedTo="1df61102-22df-4811-8862-521e7a3eb26f 45f03840-a54f-4e54-a322-6d57afe2168c" carrier="7ba9c9db-3360-465c-8560-b3b429447f17" id="a48a1647-3d8e-4b68-9eb6-28edd51a06f2"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="7ba9c9db-3360-465c-8560-b3b429447f17" id="fd573056-9967-4dca-8b89-cc714118cc8f" connectedTo="e61ed4c2-f2ec-4037-90ab-8c0a481cff68 d9ebab2a-69a1-4dfc-b0be-bc833273b03a"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="53.28203840596156" lon="5.64494431837646"/>
      </asset>
      <asset xsi:type="esdl:Import" prodType="FOSSIL" power="1000000.0" id="ea9e3d03-5207-4c1f-bf0d-e314e23f6268" name="Import_ea9e">
        <costInformation xsi:type="esdl:CostInformation">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.9" name="Import_ea9e-MarginalCosts" id="b0238a18-81b1-41be-b7d4-7e8af0a12c45"/>
        </costInformation>
        <port xsi:type="esdl:OutPort" name="Out" carrier="7ba9c9db-3360-465c-8560-b3b429447f17" id="45f03840-a54f-4e54-a322-6d57afe2168c" connectedTo="a48a1647-3d8e-4b68-9eb6-28edd51a06f2"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="53.28184278634421" lon="5.643533696986323"/>
      </asset>
      <asset xsi:type="esdl:PVInstallation" id="3559fe62-938b-4610-aafb-1cc2aa34c185" name="PVInstallation_3559">
        <port xsi:type="esdl:OutPort" name="Out" carrier="7ba9c9db-3360-465c-8560-b3b429447f17" id="1df61102-22df-4811-8862-521e7a3eb26f" connectedTo="a48a1647-3d8e-4b68-9eb6-28edd51a06f2">
          <profile xsi:type="esdl:InfluxDBProfile" port="8086" host="http://influxdb" id="967ae1ed-7132-4d89-b69d-5b458e37fd76" measurement="standard_profiles_point" endDate="2019-12-31T22:00:00.000000+0000" filters="" startDate="2018-12-23T23:00:00.000000+0000" field="Zon_deBilt" database="energy_profiles" multiplier="50.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="eb07bccb-203f-407e-af98-e687656a221d" multiplier="GIGA" physicalQuantity="ENERGY" description="Energy in GJ" unit="JOULE"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="53.282596397982836" lon="5.64422559873282"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" efficiency="1.0" power="3000.0" id="88f1a514-98d5-4120-8aa9-f303c552a6a5" name="HeatPump_88f1" COP="4.0">
        <costInformation xsi:type="esdl:CostInformation">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.2" name="HeatPump_88f1-MarginalCosts" id="912af525-fe07-47f0-835e-f00e4de2b5a9"/>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" connectedTo="fd573056-9967-4dca-8b89-cc714118cc8f" carrier="7ba9c9db-3360-465c-8560-b3b429447f17" id="e61ed4c2-f2ec-4037-90ab-8c0a481cff68"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="06d528ac-3dfc-44c2-a624-504e3cc2e46f" id="6b88194f-9943-44cc-a3cc-ffe0f19acafe" connectedTo="075cb7d3-9079-4d14-9266-02b8f963fd6c"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="53.28186847980525" lon="5.646805410835003"/>
      </asset>
      <asset xsi:type="esdl:Battery" maxDischargeRate="100000000.0" maxChargeRate="100000000.0" id="d474f60b-41fc-490a-b52e-198a2e4ff780" capacity="50000000000.0" name="Battery_d474" controlStrategy="9e33b513-0adb-4e47-9b21-306d27ed2dca">
        <port xsi:type="esdl:InPort" name="In" connectedTo="fd573056-9967-4dca-8b89-cc714118cc8f" carrier="7ba9c9db-3360-465c-8560-b3b429447f17" id="d9ebab2a-69a1-4dfc-b0be-bc833273b03a"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="53.28251305870539" lon="5.645523515351202"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
