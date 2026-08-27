<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="9" id="64d5d892-4896-4ab2-89e5-e191db4eeac6_with_return_network" description="" esdlVersion="v2207" name="PoC_validator with return network">
  <instance xsi:type="esdl:Instance" id="0ef5d5cd-0984-4fe4-a742-efffafa6f8eb" name="Untitled instance">
    <area xsi:type="esdl:Area" id="ddab37d3-fd78-4ed2-a596-bda9c514ebb6" name="Untitled area">
      <asset xsi:type="esdl:GeothermalSource" id="69435473-177a-4e0f-ac09-fb8a4bfadad0" name="GeothermalSource_6943" state="OPTIONAL">
        <port xsi:type="esdl:OutPort" connectedTo="353948f3-a4d1-4120-9b48-2e45702d18a6" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="Out" id="c8826d91-91b8-420d-aec8-9a59ebd5cb79"/>
        <port xsi:type="esdl:InPort" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="In" connectedTo="4048d690-dd3e-4ca5-a250-02ef9d57b8b2" id="2f1c24db-5c69-4f2c-a3c7-e7b72696cffa"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.00156773139614" lon="4.37058448791504"/>
      </asset>
      <asset xsi:type="esdl:GenericProducer" id="91e9b1d1-6ed3-4e0b-86e4-349f0da02131" name="GenericProducer_91e9" state="OPTIONAL">
        <port xsi:type="esdl:OutPort" connectedTo="c129e833-772a-41d7-8e13-3d1c4b3f6b77" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="Out" id="5d14c302-77b0-4c38-9a3d-681ae8277884"/>
        <port xsi:type="esdl:InPort" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="In" connectedTo="4918a956-cf1e-4173-9aa6-08a76ab9ff93" id="d07e6dc7-7e25-4c95-85e7-ae4803b66260"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.000127796500934" lon="4.374361038208009"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" id="7b064789-cee6-4957-8b85-f6bb6d5559c7" name="ResidualHeatSource_7b06">
        <port xsi:type="esdl:OutPort" connectedTo="1c348008-565e-4670-a5f9-6ffc69a7d01b" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="8ea38441-78d2-4479-9d78-9ac6d1d2ce1a"/>
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In" connectedTo="5119c93b-cf1b-4d3a-af34-756b4abdda77" id="b8814ac1-2236-4871-a341-3cc022e26050"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.99673253728782" lon="4.376678466796876"/>
        <costInformation xsi:type="esdl:CostInformation" id="e6b2525d-8a37-4eef-b36a-debcf24be976">
          <installationCosts xsi:type="esdl:SingleValue" value="10.0" id="fa010e76-da82-4c2f-9f60-87d91977de0c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" unit="EURO" id="dbe7fea2-c345-4aab-9df0-3afc27ff1751" description="Cost in EUR/kW" perMultiplier="KILO" physicalQuantity="COST"/>
          </installationCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="10.0" id="c162cc99-7c02-4866-8813-b68e72cc1d34">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" id="aeeb19dc-815c-4801-9681-9f6058bbbaf1" description="Cost in EUR/kW" perMultiplier="KILO" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatStorage" id="125d49cd-5a03-47e3-9802-1b2bd9429d72" name="HeatStorage_125d">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In" connectedTo="1c8e9957-9289-45ef-a933-35bfe890c5ae" id="80911146-ef13-484b-82dd-46dc664f6bc2"/>
        <port xsi:type="esdl:OutPort" connectedTo="9c024903-7c15-4c31-b489-53a89e72b8ba" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="d92e513e-0802-4614-9fce-452a29610c2c"/>
        <geometry xsi:type="esdl:Point" lat="51.99753843924036" lon="4.370949268341065"/>
        <costInformation xsi:type="esdl:CostInformation" id="2780924f-cb3f-4333-b7b0-3efd48837398">
          <investmentCosts xsi:type="esdl:SingleValue" value="5.0" id="4ba46146-4e0f-443b-a042-1f4d52f9f598">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="CUBIC_METRE" unit="EURO" id="3ab3f09c-0913-4488-b3c9-9252392b0403" description="Cost in EUR/m3" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="f24682d8-a8ed-4029-9709-066d87e9cc7e" name="GenericConsumer_4857">
        <port xsi:type="esdl:InPort" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="In" connectedTo="840b3ed8-1d93-4c0c-86e0-f92a3cf51098" id="634b8a0d-b532-4716-929e-dc18c103a8e4"/>
        <port xsi:type="esdl:OutPort" connectedTo="9718fd37-5eb3-4e35-a47f-ef27569d1eba" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="Out" id="b88205af-1d25-4877-a045-d2481a2b148a"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.99959936840761" lon="4.369661808013917"/>
      </asset>
      <asset xsi:type="esdl:GenericConsumer" id="48574e2f-5ad8-4139-b566-4ac026abb477" name="GenericConsumer_4857">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="4331cef7-74ea-4c66-978b-81c68f636928" id="d31f59a6-f002-4309-bc79-04d62a73b8f5">
          <profile xsi:type="esdl:InfluxDBProfile" startDate="2018-12-31T23:00:00.000000+0000" database="energy_profiles" host="profiles.warmingup.info" filters="" port="443" multiplier="0.0" endDate="2019-12-31T22:00:00.000000+0000" field="demand4_MW" measurement="WarmingUp default profiles" id="f2ca4745-8328-4973-9b29-85053eb29229">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" connectedTo="59d26897-895d-4695-88bb-fbf1356a8e78" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Out" id="70e7154f-7a05-42ac-940e-6100b6f3efcd"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.998317904376485" lon="4.370648860931397"/>
      </asset>
      <asset xsi:type="esdl:ATES" aquiferMidTemperature="17.0" salinity="10000.0" aquiferPermeability="10000.0" id="a0322022-3113-4fbd-a0e9-2ec991e0523d" wellCasingSize="13.0" maxDischargeRate="11610000.0" aquiferThickness="45.0" aquiferTopDepth="300.0" aquiferAnisotropy="4.0" aquiferPorosity="0.3" name="ATES_a032" wellDistance="150.0" aquiferNetToGross="1.0">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In" connectedTo="cc9bdffe-7f12-4e2d-86c3-40cd994da3c0" id="5117c2be-331e-4a58-90e9-e060dcb2164f"/>
        <port xsi:type="esdl:OutPort" connectedTo="932edd96-1ea3-4793-bf69-a88603b79714" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="29b5f410-66fc-4d68-b318-2da1a0cb01b4"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.99634939848474" lon="4.372107982635499"/>
        <costInformation xsi:type="esdl:CostInformation">
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="30000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/yr" unit="EURO" perTimeUnit="YEAR" id="574ef21d-681a-43ae-a1cb-f7b25d88defb"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="69666.67">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/yr" unit="EURO" perTimeUnit="YEAR" id="3c9f580e-b71a-4bc8-8cea-cb6788c0bf49"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="2333594.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR" unit="EURO" id="a3b5cdd9-364b-4262-bce5-4658c5f1bac9"/>
          </investmentCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" value="115472.22">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/yr" unit="EURO" perTimeUnit="YEAR" id="57537388-7fd7-40b3-a0c4-0ce65648eaab"/>
          </fixedMaintenanceCosts>
        </costInformation>
        <dataSource xsi:type="esdl:DataSource" name="WarmingUp factsheet: HT-ATES (high)" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D" attribution=""/>
      </asset>
      <asset xsi:type="esdl:GenericConversion" id="a7351e21-9d5e-4fb9-b6bf-42188a59f6d9" name="GenericConversion_a735">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="PrimIn" connectedTo="543f7bc3-ec95-4bce-a280-ad224b21e79f" id="05edfd66-58cb-4160-b17d-81cb24ae2d8a"/>
        <port xsi:type="esdl:OutPort" connectedTo="7b9faa39-33c2-45a1-9435-7599cd00d8f0" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="PrimOut" id="886cb245-2998-4d69-9c68-b8a3b4e54eb2"/>
        <port xsi:type="esdl:InPort" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="SecIn" connectedTo="3163e284-2f59-45d0-ae19-400cdd2f6c47" id="924a166b-8581-4e28-bde4-36c6653c39a9"/>
        <port xsi:type="esdl:OutPort" connectedTo="b22b4128-9d66-4b16-9adf-18b793b10ca1" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="SecOut" id="0413c46d-1361-49db-9b78-d209bf626a49"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.99992963669694" lon="4.3708205223083505"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe100" id="Pipe1" diameter="DN200" name="Pipe1" length="160.1">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="29b5f410-66fc-4d68-b318-2da1a0cb01b4" id="932edd96-1ea3-4793-bf69-a88603b79714"/>
        <port xsi:type="esdl:OutPort" connectedTo="21b35089-83d0-41a1-b5d5-c827a53956db" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="212d3f29-13ab-4abc-9ca5-f5b381e634c0"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99634939848474" lon="4.372107982635499"/>
          <point xsi:type="esdl:Point" lat="51.99685969901065" lon="4.374293982982636"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe2_ret" id="Pipe200" diameter="DN200" name="Pipe200" length="179.9">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="1889d55b-e9c9-4418-92e5-1c6fba4ccc3e" id="2265fc97-11bf-41cf-940e-880fe18081a6"/>
        <port xsi:type="esdl:OutPort" connectedTo="80911146-ef13-484b-82dd-46dc664f6bc2" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="1c8e9957-9289-45ef-a933-35bfe890c5ae"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99816102159465" lon="4.373373985290528"/>
          <point xsi:type="esdl:Point" lat="51.99753843924036" lon="4.370949268341065"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" id="ff92b034-ff9f-4810-a67c-192da985adb0" name="Joint_ff92">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="3aefcf2a-c0c3-40d2-8e34-2ba5f088b88e 169618d1-2db1-463f-94e0-36b5a8f1a87e" id="f665829f-1dd7-4d9c-8e29-0f2a4084cf0e"/>
        <port xsi:type="esdl:OutPort" connectedTo="758181aa-376b-4bc0-a9e8-0dd6f0b3e8e1" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="fe17169e-67d7-4de4-9480-f6fdc5a00a3e"/>
        <geometry xsi:type="esdl:Point" lat="51.99877864115756" lon="4.372985064983369"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe3_ret" id="Pipe3" diameter="DN200" name="Pipe3" length="73.43" state="OPTIONAL">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="1889d55b-e9c9-4418-92e5-1c6fba4ccc3e" id="85aac4b2-ee22-4cac-9726-6dc5360c9bc8"/>
        <port xsi:type="esdl:OutPort" connectedTo="f665829f-1dd7-4d9c-8e29-0f2a4084cf0e" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="3aefcf2a-c0c3-40d2-8e34-2ba5f088b88e"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99818248979724" lon="4.37344640493393"/>
          <point xsi:type="esdl:Point" lat="51.99877864115756" lon="4.372985064983369"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" id="8fbf512c-7c77-469e-b1c5-170dc7e3ac40" name="Joint_8fbf">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="d63c5508-228f-4245-ad0a-dfa9156a902e" id="2f452e85-1605-430a-a617-f5ed54cb5989"/>
        <port xsi:type="esdl:OutPort" connectedTo="2265fc97-11bf-41cf-940e-880fe18081a6 85aac4b2-ee22-4cac-9726-6dc5360c9bc8" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="1889d55b-e9c9-4418-92e5-1c6fba4ccc3e"/>
        <geometry xsi:type="esdl:Point" lat="51.99818248979724" lon="4.37344640493393"/>
      </asset>
      <asset xsi:type="esdl:HeatExchange" id="39179dff-ed97-45c4-a4b7-0a885c59faa7" name="HeatExchange_3917">
        <port xsi:type="esdl:InPort" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="PrimIn" connectedTo="b33610cd-97b5-4d66-841f-13910920ab1a" id="01219fb1-1753-47e7-8abc-9fc1eb7d37ef"/>
        <port xsi:type="esdl:OutPort" connectedTo="65667491-b080-4aed-84a8-503b7b4dda7c" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="PrimOut" id="9e9f2b7f-5321-4dd0-8cb8-a224ec3cfbfd"/>
        <port xsi:type="esdl:OutPort" connectedTo="ec0588a1-9955-4326-87c0-ee2700cdec07" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="SecOut" id="4fbc5cee-696e-42c8-a1bd-3e375b1cc71c"/>
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="SecIn" connectedTo="1c0be7db-0f4e-46f7-9938-9312c91e6d40" id="c148e87a-1bc5-4a56-8960-dbe5856fb22c"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.999890004630885" lon="4.373379349708558"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="811e1536-d7f9-4853-bfa0-06a8377d6442" name="HeatPump_811e">
        <port xsi:type="esdl:InPort" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="PrimIn" connectedTo="24c3aa52-caed-4fb5-b8d1-25a56e57e11d" id="804fe992-e102-4bca-bb60-7944ee32de49"/>
        <port xsi:type="esdl:OutPort" connectedTo="b9359777-c334-4997-92b2-1bad1ca894f1" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="PrimOut" id="4522e76b-6aa8-4bdf-85af-b6d8cf05748d"/>
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="SecIn" connectedTo="2fe6c4c6-f91e-43b4-8435-cf74782cf8a7" id="1687df9e-4c47-47e3-a208-270462f5e825"/>
        <port xsi:type="esdl:OutPort" connectedTo="cc84ed87-eb4f-4a26-b5ae-f432dee8299d" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="SecOut" id="cf151822-1dc3-49d1-8985-7048ac66a30c"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.00103932030095" lon="4.3710458278656015"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe4_ret" id="Pipe4" diameter="DN200" name="Pipe4" length="107.05">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="fe17169e-67d7-4de4-9480-f6fdc5a00a3e" id="758181aa-376b-4bc0-a9e8-0dd6f0b3e8e1"/>
        <port xsi:type="esdl:OutPort" connectedTo="93d8042b-8a8d-4470-8599-f020470deec3" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="f90ef2a7-675d-4de4-8d87-480aa502b7b3"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99877864115756" lon="4.372985064983369"/>
          <point xsi:type="esdl:Point" lat="51.99965221149765" lon="4.37232792377472"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" id="282ad13c-91ee-4e51-a0db-2bd24cf8d789" name="Joint_282a">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="f90ef2a7-675d-4de4-8d87-480aa502b7b3 29450227-4cd9-4463-bf4c-f260799680e5" id="93d8042b-8a8d-4470-8599-f020470deec3"/>
        <port xsi:type="esdl:OutPort" connectedTo="1fece602-3c8c-4e23-a626-b5c555c45aad" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="1fcf7c2c-bd53-4b4f-85bc-8ede724fde26"/>
        <geometry xsi:type="esdl:Point" lat="51.99965221149765" lon="4.37232792377472"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe5_ret" id="Pipe5" diameter="DN200" name="Pipe5" length="205.45">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="8ea38441-78d2-4479-9d78-9ac6d1d2ce1a" id="1c348008-565e-4670-a5f9-6ffc69a7d01b"/>
        <port xsi:type="esdl:OutPort" connectedTo="21b35089-83d0-41a1-b5d5-c827a53956db" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="3e7ae6d0-b36a-4cba-884f-5550f212e351"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99673253728782" lon="4.376678466796876"/>
          <point xsi:type="esdl:Point" lat="51.996336186743406" lon="4.374747276306153"/>
          <point xsi:type="esdl:Point" lat="51.99687786494158" lon="4.374350309371949"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe6_ret" id="Pipe6" diameter="DN200" name="Pipe6" length="157.72">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="ab617325-03fd-45d6-88a2-db304ef1c3cb" id="6de4b5b4-026c-4f94-9bd0-d9336556fefa"/>
        <port xsi:type="esdl:OutPort" connectedTo="2f452e85-1605-430a-a617-f5ed54cb5989" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="d63c5508-228f-4245-ad0a-dfa9156a902e"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99687786494158" lon="4.374350309371949"/>
          <point xsi:type="esdl:Point" lat="51.99810652534175" lon="4.373502731323243"/>
          <point xsi:type="esdl:Point" lat="51.99818248979724" lon="4.37344640493393"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" id="05734efb-c631-4294-91f6-d27c221b0a96" name="Joint_0573">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="212d3f29-13ab-4abc-9ca5-f5b381e634c0 3e7ae6d0-b36a-4cba-884f-5550f212e351" id="21b35089-83d0-41a1-b5d5-c827a53956db"/>
        <port xsi:type="esdl:OutPort" connectedTo="6de4b5b4-026c-4f94-9bd0-d9336556fefa" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="ab617325-03fd-45d6-88a2-db304ef1c3cb"/>
        <geometry xsi:type="esdl:Point" lat="51.99687786494158" lon="4.374350309371949"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe7_ret" id="Pipe7" diameter="DN200" name="Pipe7" length="72.62">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="1fcf7c2c-bd53-4b4f-85bc-8ede724fde26" id="1fece602-3c8c-4e23-a626-b5c555c45aad"/>
        <port xsi:type="esdl:OutPort" connectedTo="f7865935-a5da-4398-9124-3aa43a6691fc" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="144f3d60-fc67-405a-808a-d006d32ac9fc"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99965221149765" lon="4.37232792377472"/>
          <point xsi:type="esdl:Point" lat="52.00021366547689" lon="4.371786117553712"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe8_ret" id="Pipe8" diameter="DN200" name="Pipe8" length="93.52">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="cf151822-1dc3-49d1-8985-7048ac66a30c" id="cc84ed87-eb4f-4a26-b5ae-f432dee8299d"/>
        <port xsi:type="esdl:OutPort" connectedTo="f7865935-a5da-4398-9124-3aa43a6691fc" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="2417dce6-2ae5-41dd-a847-a9fab55996b9"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.000950150313486" lon="4.371126294136048"/>
          <point xsi:type="esdl:Point" lat="52.00021366547689" lon="4.371786117553712"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" id="2bec564e-c47d-4450-b036-c65de6f1069c" name="Joint_2bec">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="144f3d60-fc67-405a-808a-d006d32ac9fc 2417dce6-2ae5-41dd-a847-a9fab55996b9" id="f7865935-a5da-4398-9124-3aa43a6691fc"/>
        <port xsi:type="esdl:OutPort" connectedTo="b64d122c-8699-47e4-9a6d-e0145dce3ac6" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="3a4508b8-328d-4b78-b0e0-e5134b67b73c"/>
        <geometry xsi:type="esdl:Point" lat="52.00021366547689" lon="4.371786117553712"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe9_ret" id="Pipe9" diameter="DN200" name="Pipe9" length="72.2">
        <port xsi:type="esdl:InPort" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="In" connectedTo="5d14c302-77b0-4c38-9a3d-681ae8277884" id="c129e833-772a-41d7-8e13-3d1c4b3f6b77"/>
        <port xsi:type="esdl:OutPort" connectedTo="01219fb1-1753-47e7-8abc-9fc1eb7d37ef" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="Out" id="b33610cd-97b5-4d66-841f-13910920ab1a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.000127796500934" lon="4.374361038208009"/>
          <point xsi:type="esdl:Point" lat="51.999890004630885" lon="4.373379349708558"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe10_ret" id="Pipe10" diameter="DN200" name="Pipe10" length="66.7">
        <port xsi:type="esdl:InPort" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="In" connectedTo="c8826d91-91b8-420d-aec8-9a59ebd5cb79" id="353948f3-a4d1-4120-9b48-2e45702d18a6"/>
        <port xsi:type="esdl:OutPort" connectedTo="804fe992-e102-4bca-bb60-7944ee32de49" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="Out" id="24c3aa52-caed-4fb5-b8d1-25a56e57e11d"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.00156773139614" lon="4.37058448791504"/>
          <point xsi:type="esdl:Point" lat="52.00103932030095" lon="4.3710458278656015"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe11_ret" id="Pipe11" diameter="DN200" name="Pipe11" length="73.3">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="3a4508b8-328d-4b78-b0e0-e5134b67b73c" id="b64d122c-8699-47e4-9a6d-e0145dce3ac6"/>
        <port xsi:type="esdl:OutPort" connectedTo="05edfd66-58cb-4160-b17d-81cb24ae2d8a" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="543f7bc3-ec95-4bce-a280-ad224b21e79f"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.00021366547689" lon="4.371786117553712"/>
          <point xsi:type="esdl:Point" lat="51.99992963669694" lon="4.3708205223083505"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe12_ret" id="Pipe12" diameter="DN200" name="Pipe12" length="76.7">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="4fbc5cee-696e-42c8-a1bd-3e375b1cc71c" id="ec0588a1-9955-4326-87c0-ee2700cdec07"/>
        <port xsi:type="esdl:OutPort" connectedTo="93d8042b-8a8d-4470-8599-f020470deec3" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="29450227-4cd9-4463-bf4c-f260799680e5"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.999890004630885" lon="4.373379349708558"/>
          <point xsi:type="esdl:Point" lat="51.99965221149765" lon="4.37232792377472"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe13_ret" id="Pipe13" diameter="DN200" name="Pipe13" length="87.4">
        <port xsi:type="esdl:InPort" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="In" connectedTo="0413c46d-1361-49db-9b78-d209bf626a49" id="b22b4128-9d66-4b16-9adf-18b793b10ca1"/>
        <port xsi:type="esdl:OutPort" connectedTo="634b8a0d-b532-4716-929e-dc18c103a8e4" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="Out" id="840b3ed8-1d93-4c0c-86e0-f92a3cf51098"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.99992963669694" lon="4.3708205223083505"/>
          <point xsi:type="esdl:Point" lat="51.99959936840761" lon="4.369661808013917"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe14_ret" id="Pipe14" diameter="DN200" name="Pipe14" length="167.9">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="In" connectedTo="70e7154f-7a05-42ac-940e-6100b6f3efcd" id="59d26897-895d-4695-88bb-fbf1356a8e78"/>
        <port xsi:type="esdl:OutPort" connectedTo="f665829f-1dd7-4d9c-8e29-0f2a4084cf0e" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Out" id="169618d1-2db1-463f-94e0-36b5a8f1a87e"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.998317904376485" lon="4.370648860931397"/>
          <point xsi:type="esdl:Point" lat="51.99877864115756" lon="4.372985064983369"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" id="35bb0bef-8129-4904-9a55-5300e5c2950e" name="Joint_ff92_ret">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="ret_port" connectedTo="1c650436-fa83-496c-a2b4-26e01c40c0bd" id="4d3acc63-cc4c-4252-b713-5dc253fa372f"/>
        <port xsi:type="esdl:OutPort" connectedTo="e09f1314-f102-4c2c-9813-3671f5a49a31 d2fd8eb1-f117-481b-a7b9-4540418d4c67" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="ret_port" id="1e28e9eb-2cb3-4932-a49a-e7f2aec0aaeb"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.998868641247554" lon="4.372198467776014"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="4bca66e2-92d1-47de-bbf0-0551ff715b52" name="Joint_8fbf_ret">
        <port xsi:type="esdl:OutPort" connectedTo="2deedf70-eff5-48d2-bc78-2d54c0422ff9" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="ret_port" id="a058a1d0-0d9f-4645-b60c-21dc2a0cf67a"/>
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="ret_port" connectedTo="949a97f1-8832-4a98-9cc7-80b80cf60f50 04012d8b-f486-4258-8ba5-27c2913d78a2" id="5df2e2e9-11d5-40e5-ad7c-11195bd1dd85"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.998272489887235" lon="4.372656936860683"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="7067a514-0569-4148-aae3-547772e6fc86" name="Joint_282a_ret">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="ret_port" connectedTo="57954b34-e10d-402f-ad2e-7904864e53cb" id="4dea40a3-57eb-4700-8489-db05bf543cdd"/>
        <port xsi:type="esdl:OutPort" connectedTo="b8c4972e-f6b6-4ae9-910b-7077ff98d8e4 a4b2fefd-c5bc-4e06-9d73-4583367aaf82" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="ret_port" id="4354ee60-c6a5-433d-bdbb-b8048aced6d4"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.999742211587645" lon="4.371545495375693"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="5b5bcd97-8ff2-4714-af80-771497d34b77" name="Joint_0573_ret">
        <port xsi:type="esdl:OutPort" connectedTo="6772b5c0-412a-4c28-9ba9-378958db1012 d70b22e4-66cd-47f2-a031-189798413c2d" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="ret_port" id="8b43442e-79c7-4c19-8b1c-540569b2c694"/>
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="ret_port" connectedTo="5cd9ac8b-a202-40d7-bb85-ef65b84ed460" id="f42dfb30-2be9-4342-9364-b9bddef91bf0"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.99696786503158" lon="4.373554483969099"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="5f9f5272-b0aa-430e-bdd1-9b7f3e1e0ad9" name="Joint_2bec_ret">
        <port xsi:type="esdl:OutPort" connectedTo="84ed5a37-abea-499c-86a3-812ee9afbbaa 850df741-7f26-4c62-a2ed-729bc5182594" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="ret_port" id="73d88995-4167-42b2-be82-b08ee3b3b237"/>
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="ret_port" connectedTo="e0425bf8-dace-4f91-b2bf-174d33009fc0" id="6f01c805-e20e-422b-b9e8-0ee762b3965b"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.00030366556689" lon="4.371006344936896"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe1" id="Pipe100" diameter="DN200" name="Pipe100" length="160.1">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In_ret" connectedTo="8b43442e-79c7-4c19-8b1c-540569b2c694" id="6772b5c0-412a-4c28-9ba9-378958db1012"/>
        <port xsi:type="esdl:OutPort" connectedTo="5117c2be-331e-4a58-90e9-e060dcb2164f" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Out_ret" id="cc9bdffe-7f12-4e2d-86c3-40cd994da3c0"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99694969910065" lon="4.373498068326272"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.996439398574736" lon="4.371309552438089"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe200" id="Pipe2_ret" diameter="DN200" name="Pipe2_ret" length="179.9">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In_ret" connectedTo="d92e513e-0802-4614-9fce-452a29610c2c" id="9c024903-7c15-4c31-b489-53a89e72b8ba"/>
        <port xsi:type="esdl:OutPort" connectedTo="5df2e2e9-11d5-40e5-ad7c-11195bd1dd85" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Out_ret" id="04012d8b-f486-4258-8ba5-27c2913d78a2"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.997628439330356" lon="4.370156674775391"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998251021684645" lon="4.372584413437383"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe3" id="Pipe3_ret" diameter="DN200" name="Pipe3_ret" length="73.43" state="OPTIONAL">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In_ret" connectedTo="1e28e9eb-2cb3-4932-a49a-e7f2aec0aaeb" id="e09f1314-f102-4c2c-9813-3671f5a49a31"/>
        <port xsi:type="esdl:OutPort" connectedTo="5df2e2e9-11d5-40e5-ad7c-11195bd1dd85" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Out_ret" id="949a97f1-8832-4a98-9cc7-80b80cf60f50"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998868641247554" lon="4.372198467776014"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998272489887235" lon="4.372656936860683"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe4" id="Pipe4_ret" diameter="DN200" name="Pipe4_ret" length="107.05">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In_ret" connectedTo="4354ee60-c6a5-433d-bdbb-b8048aced6d4" id="b8c4972e-f6b6-4ae9-910b-7077ff98d8e4"/>
        <port xsi:type="esdl:OutPort" connectedTo="4d3acc63-cc4c-4252-b713-5dc253fa372f" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Out_ret" id="1c650436-fa83-496c-a2b4-26e01c40c0bd"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.999742211587645" lon="4.371545495375693"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998868641247554" lon="4.372198467776014"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe5" id="Pipe5_ret" diameter="DN200" name="Pipe5_ret" length="205.45">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In_ret" connectedTo="8b43442e-79c7-4c19-8b1c-540569b2c694" id="d70b22e4-66cd-47f2-a031-189798413c2d"/>
        <port xsi:type="esdl:OutPort" connectedTo="b8814ac1-2236-4871-a341-3cc022e26050" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Out_ret" id="5119c93b-cf1b-4d3a-af34-756b4abdda77"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99696786503158" lon="4.373554483969099"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.9964261868334" lon="4.373948780767135"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99682253737782" lon="4.375881926796532"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe6" id="Pipe6_ret" diameter="DN200" name="Pipe6_ret" length="157.72">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In_ret" connectedTo="a058a1d0-0d9f-4645-b60c-21dc2a0cf67a" id="2deedf70-eff5-48d2-bc78-2d54c0422ff9"/>
        <port xsi:type="esdl:OutPort" connectedTo="f42dfb30-2be9-4342-9364-b9bddef91bf0" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Out_ret" id="5cd9ac8b-a202-40d7-bb85-ef65b84ed460"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998272489887235" lon="4.372656936860683"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998196525431744" lon="4.372712895904377"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99696786503158" lon="4.373554483969099"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe7" id="Pipe7_ret" diameter="DN200" name="Pipe7_ret" length="72.62">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In_ret" connectedTo="73d88995-4167-42b2-be82-b08ee3b3b237" id="84ed5a37-abea-499c-86a3-812ee9afbbaa"/>
        <port xsi:type="esdl:OutPort" connectedTo="4dea40a3-57eb-4700-8489-db05bf543cdd" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Out_ret" id="57954b34-e10d-402f-ad2e-7904864e53cb"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00030366556689" lon="4.371006344936896"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.999742211587645" lon="4.371545495375693"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe8" id="Pipe8_ret" diameter="DN200" name="Pipe8_ret" length="93.52">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In_ret" connectedTo="73d88995-4167-42b2-be82-b08ee3b3b237" id="850df741-7f26-4c62-a2ed-729bc5182594"/>
        <port xsi:type="esdl:OutPort" connectedTo="1687df9e-4c47-47e3-a208-270462f5e825" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Out_ret" id="2fe6c4c6-f91e-43b4-8435-cf74782cf8a7"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00030366556689" lon="4.371006344936896"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00104015040348" lon="4.37034997764605"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe9" id="Pipe9_ret" diameter="DN200" name="Pipe9_ret" length="72.2">
        <port xsi:type="esdl:InPort" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="In_ret" connectedTo="9e9f2b7f-5321-4dd0-8cb8-a224ec3cfbfd" id="65667491-b080-4aed-84a8-503b7b4dda7c"/>
        <port xsi:type="esdl:OutPort" connectedTo="d07e6dc7-7e25-4c95-85e7-ae4803b66260" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="Out_ret" id="4918a956-cf1e-4173-9aa6-08a76ab9ff93"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99998000472088" lon="4.372598048350767"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00021779659093" lon="4.37358086059924"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe10" id="Pipe10_ret" diameter="DN200" name="Pipe10_ret" length="66.7">
        <port xsi:type="esdl:InPort" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="In_ret" connectedTo="4522e76b-6aa8-4bdf-85af-b6d8cf05748d" id="b9359777-c334-4997-92b2-1bad1ca894f1"/>
        <port xsi:type="esdl:OutPort" connectedTo="2f1c24db-5c69-4f2c-a3c7-e7b72696cffa" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="Out_ret" id="4048d690-dd3e-4ca5-a250-02ef9d57b8b2"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.001129320390945" lon="4.370269927719944"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00165773148614" lon="4.369811045716992"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe11" id="Pipe11_ret" diameter="DN200" name="Pipe11_ret" length="73.3">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In_ret" connectedTo="886cb245-2998-4d69-9c68-b8a3b4e54eb2" id="7b9faa39-33c2-45a1-9435-7599cd00d8f0"/>
        <port xsi:type="esdl:OutPort" connectedTo="6f01c805-e20e-422b-b9e8-0ee762b3965b" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Out_ret" id="e0425bf8-dace-4f91-b2bf-174d33009fc0"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00001963678694" lon="4.370039408470301"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00030366556689" lon="4.371006344936896"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe12" id="Pipe12_ret" diameter="DN200" name="Pipe12_ret" length="76.7">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In_ret" connectedTo="4354ee60-c6a5-433d-bdbb-b8048aced6d4" id="a4b2fefd-c5bc-4e06-9d73-4583367aaf82"/>
        <port xsi:type="esdl:OutPort" connectedTo="c148e87a-1bc5-4a56-8960-dbe5856fb22c" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Out_ret" id="1c0be7db-0f4e-46f7-9938-9312c91e6d40"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.999742211587645" lon="4.371545495375693"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99998000472088" lon="4.372598048350767"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe13" id="Pipe13_ret" diameter="DN200" name="Pipe13_ret" length="87.4">
        <port xsi:type="esdl:InPort" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="In_ret" connectedTo="b88205af-1d25-4877-a045-d2481a2b148a" id="9718fd37-5eb3-4e35-a47f-ef27569d1eba"/>
        <port xsi:type="esdl:OutPort" connectedTo="924a166b-8581-4e28-bde4-36c6653c39a9" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="Out_ret" id="3163e284-2f59-45d0-ae19-400cdd2f6c47"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.999689368497606" lon="4.3688791287127415"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00001963678694" lon="4.370039408470301"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe14" id="Pipe14_ret" diameter="DN200" name="Pipe14_ret" length="167.9">
        <port xsi:type="esdl:InPort" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="In_ret" connectedTo="1e28e9eb-2cb3-4932-a49a-e7f2aec0aaeb" id="d2fd8eb1-f117-481b-a7b9-4540418d4c67"/>
        <port xsi:type="esdl:OutPort" connectedTo="d31f59a6-f002-4309-bc79-04d62a73b8f5" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Out_ret" id="4331cef7-74ea-4c66-978b-81c68f636928"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998868641247554" lon="4.372198467776014"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99840790446648" lon="4.369860046832058"/>
        </geometry>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="e34599a1-c660-422a-9653-c6adfbc8eac4">
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="dff89c05-6bdf-49ec-ab0c-fa9ff7e280b1">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" unit="WATT" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA"/>
    </quantityAndUnits>
    <carriers xsi:type="esdl:Carriers" id="c081ae3d-af0e-45dd-92e1-52deb64f688a">
      <carrier xsi:type="esdl:HeatCommodity" id="02ccd4ed-723b-40dd-811a-0ded707e8f7f" supplyTemperature="70.0" name="Primary"/>
      <carrier xsi:type="esdl:HeatCommodity" id="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" supplyTemperature="60.0" name="Secondary"/>
      <carrier xsi:type="esdl:HeatCommodity" id="3be4c7f5-4282-440c-988e-06ff4e54f597" supplyTemperature="100.0" name="highT"/>
      <carrier xsi:type="esdl:HeatCommodity" id="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" returnTemperature="40.0" name="Primary_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" id="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" returnTemperature="35.0" name="Secondary_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" id="3be4c7f5-4282-440c-988e-06ff4e54f597_ret" returnTemperature="60.0" name="highT_re"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
