<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="PoC_validator with return network" description="" version="7" esdlVersion="v2207" id="64d5d892-4896-4ab2-89e5-e191db4eeac6_with_return_network">
  <instance xsi:type="esdl:Instance" name="Untitled instance" id="0ef5d5cd-0984-4fe4-a742-efffafa6f8eb">
    <area xsi:type="esdl:Area" name="Untitled area" id="ddab37d3-fd78-4ed2-a596-bda9c514ebb6">
      <asset xsi:type="esdl:GeothermalSource" id="69435473-177a-4e0f-ac09-fb8a4bfadad0" name="GeothermalSource_6943">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.00156773139614" lon="4.37058448791504"/>
        <port xsi:type="esdl:OutPort" connectedTo="353948f3-a4d1-4120-9b48-2e45702d18a6" name="Out" id="c8826d91-91b8-420d-aec8-9a59ebd5cb79" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9"/>
        <port xsi:type="esdl:InPort" connectedTo="4048d690-dd3e-4ca5-a250-02ef9d57b8b2" name="In" id="2f1c24db-5c69-4f2c-a3c7-e7b72696cffa" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret"/>
      </asset>
      <asset xsi:type="esdl:GenericProducer" id="91e9b1d1-6ed3-4e0b-86e4-349f0da02131" name="GenericProducer_91e9">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.000127796500934" lon="4.374361038208009"/>
        <port xsi:type="esdl:OutPort" connectedTo="c129e833-772a-41d7-8e13-3d1c4b3f6b77" name="Out" id="5d14c302-77b0-4c38-9a3d-681ae8277884" carrier="3be4c7f5-4282-440c-988e-06ff4e54f597"/>
        <port xsi:type="esdl:InPort" connectedTo="4918a956-cf1e-4173-9aa6-08a76ab9ff93" name="In" id="d07e6dc7-7e25-4c95-85e7-ae4803b66260" carrier="3be4c7f5-4282-440c-988e-06ff4e54f597_ret"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" id="7b064789-cee6-4957-8b85-f6bb6d5559c7" name="ResidualHeatSource_7b06">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.99673253728782" lon="4.376678466796876"/>
        <port xsi:type="esdl:OutPort" connectedTo="1c348008-565e-4670-a5f9-6ffc69a7d01b" name="Out" id="8ea38441-78d2-4479-9d78-9ac6d1d2ce1a" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:InPort" connectedTo="5119c93b-cf1b-4d3a-af34-756b4abdda77" name="In" id="b8814ac1-2236-4871-a341-3cc022e26050" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="e6b2525d-8a37-4eef-b36a-debcf24be976">
          <investmentCosts xsi:type="esdl:SingleValue" value="10.0" id="c162cc99-7c02-4866-8813-b68e72cc1d34">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" perMultiplier="KILO" description="Cost in EUR/kW" physicalQuantity="COST" unit="EURO" id="aeeb19dc-815c-4801-9681-9f6058bbbaf1"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="10.0" id="fa010e76-da82-4c2f-9f60-87d91977de0c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" perMultiplier="KILO" description="Cost in EUR/kW" physicalQuantity="COST" unit="EURO" id="dbe7fea2-c345-4aab-9df0-3afc27ff1751"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatStorage" id="125d49cd-5a03-47e3-9802-1b2bd9429d72" name="HeatStorage_125d">
        <geometry xsi:type="esdl:Point" lat="51.99753843924036" lon="4.370949268341065"/>
        <port xsi:type="esdl:InPort" connectedTo="1c8e9957-9289-45ef-a933-35bfe890c5ae" name="In" id="80911146-ef13-484b-82dd-46dc664f6bc2" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="9c024903-7c15-4c31-b489-53a89e72b8ba" name="Out" id="d92e513e-0802-4614-9fce-452a29610c2c" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <costInformation xsi:type="esdl:CostInformation" id="2780924f-cb3f-4333-b7b0-3efd48837398">
          <investmentCosts xsi:type="esdl:SingleValue" value="5.0" id="4ba46146-4e0f-443b-a042-1f4d52f9f598">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="CUBIC_METRE" description="Cost in EUR/m3" unit="EURO" physicalQuantity="COST" id="3ab3f09c-0913-4488-b3c9-9252392b0403"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="f24682d8-a8ed-4029-9709-066d87e9cc7e" name="GenericConsumer_4857">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.99959936840761" lon="4.369661808013917"/>
        <port xsi:type="esdl:InPort" connectedTo="840b3ed8-1d93-4c0c-86e0-f92a3cf51098" name="In" id="634b8a0d-b532-4716-929e-dc18c103a8e4" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9"/>
        <port xsi:type="esdl:OutPort" connectedTo="9718fd37-5eb3-4e35-a47f-ef27569d1eba" name="Out" id="b88205af-1d25-4877-a045-d2481a2b148a" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret"/>
      </asset>
      <asset xsi:type="esdl:GenericConsumer" id="48574e2f-5ad8-4139-b566-4ac026abb477" name="GenericConsumer_4857">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.998317904376485" lon="4.370648860931397"/>
        <port xsi:type="esdl:InPort" connectedTo="4331cef7-74ea-4c66-978b-81c68f636928" name="In" id="d31f59a6-f002-4309-bc79-04d62a73b8f5" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="59d26897-895d-4695-88bb-fbf1356a8e78" name="Out" id="70e7154f-7a05-42ac-940e-6100b6f3efcd" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:ATES" maxDischargeRate="11610000.0" aquiferPorosity="0.3" aquiferNetToGross="1.0" salinity="10000.0" aquiferThickness="45.0" aquiferMidTemperature="17.0" aquiferTopDepth="300.0" wellDistance="150.0" wellCasingSize="13.0" name="ATES_a032" id="a0322022-3113-4fbd-a0e9-2ec991e0523d" aquiferAnisotropy="4.0" aquiferPermeability="10000.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.99634939848474" lon="4.372107982635499"/>
        <dataSource xsi:type="esdl:DataSource" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D" attribution="" name="WarmingUp factsheet: HT-ATES (high)"/>
        <port xsi:type="esdl:InPort" connectedTo="cc9bdffe-7f12-4e2d-86c3-40cd994da3c0" name="In" id="5117c2be-331e-4a58-90e9-e060dcb2164f" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="932edd96-1ea3-4793-bf69-a88603b79714" name="Out" id="29b5f410-66fc-4d68-b318-2da1a0cb01b4" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <costInformation xsi:type="esdl:CostInformation">
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="69666.67">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/yr" perTimeUnit="YEAR" unit="EURO" id="3c9f580e-b71a-4bc8-8cea-cb6788c0bf49"/>
          </variableOperationalCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" value="115472.22">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/yr" perTimeUnit="YEAR" unit="EURO" id="57537388-7fd7-40b3-a0c4-0ce65648eaab"/>
          </fixedMaintenanceCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="30000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/yr" perTimeUnit="YEAR" unit="EURO" id="574ef21d-681a-43ae-a1cb-f7b25d88defb"/>
          </fixedOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="2333594.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR" unit="EURO" id="a3b5cdd9-364b-4262-bce5-4658c5f1bac9"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GenericConversion" id="a7351e21-9d5e-4fb9-b6bf-42188a59f6d9" name="GenericConversion_a735">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.99992963669694" lon="4.3708205223083505"/>
        <port xsi:type="esdl:InPort" connectedTo="543f7bc3-ec95-4bce-a280-ad224b21e79f" name="PrimIn" id="05edfd66-58cb-4160-b17d-81cb24ae2d8a" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="7b9faa39-33c2-45a1-9435-7599cd00d8f0" name="PrimOut" id="886cb245-2998-4d69-9c68-b8a3b4e54eb2" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:InPort" connectedTo="3163e284-2f59-45d0-ae19-400cdd2f6c47" name="SecIn" id="924a166b-8581-4e28-bde4-36c6653c39a9" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="b22b4128-9d66-4b16-9adf-18b793b10ca1" name="SecOut" id="0413c46d-1361-49db-9b78-d209bf626a49" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="160.1" id="Pipe1" name="Pipe1" related="Pipe100" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99634939848474" lon="4.372107982635499"/>
          <point xsi:type="esdl:Point" lat="51.99685969901065" lon="4.374293982982636"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="29b5f410-66fc-4d68-b318-2da1a0cb01b4" name="In" id="932edd96-1ea3-4793-bf69-a88603b79714" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="21b35089-83d0-41a1-b5d5-c827a53956db" name="Out" id="212d3f29-13ab-4abc-9ca5-f5b381e634c0" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="179.9" id="Pipe200" name="Pipe200" related="Pipe2_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99816102159465" lon="4.373373985290528"/>
          <point xsi:type="esdl:Point" lat="51.99753843924036" lon="4.370949268341065"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="1889d55b-e9c9-4418-92e5-1c6fba4ccc3e" name="In" id="2265fc97-11bf-41cf-940e-880fe18081a6" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="80911146-ef13-484b-82dd-46dc664f6bc2" name="Out" id="1c8e9957-9289-45ef-a933-35bfe890c5ae" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="ff92b034-ff9f-4810-a67c-192da985adb0" name="Joint_ff92">
        <geometry xsi:type="esdl:Point" lat="51.99877864115756" lon="4.372985064983369"/>
        <port xsi:type="esdl:InPort" connectedTo="3aefcf2a-c0c3-40d2-8e34-2ba5f088b88e 169618d1-2db1-463f-94e0-36b5a8f1a87e" name="In" id="f665829f-1dd7-4d9c-8e29-0f2a4084cf0e" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="758181aa-376b-4bc0-a9e8-0dd6f0b3e8e1" name="Out" id="fe17169e-67d7-4de4-9480-f6fdc5a00a3e" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="73.43" id="Pipe3" name="Pipe3" related="Pipe3_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99818248979724" lon="4.37344640493393"/>
          <point xsi:type="esdl:Point" lat="51.99877864115756" lon="4.372985064983369"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="1889d55b-e9c9-4418-92e5-1c6fba4ccc3e" name="In" id="85aac4b2-ee22-4cac-9726-6dc5360c9bc8" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="f665829f-1dd7-4d9c-8e29-0f2a4084cf0e" name="Out" id="3aefcf2a-c0c3-40d2-8e34-2ba5f088b88e" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="8fbf512c-7c77-469e-b1c5-170dc7e3ac40" name="Joint_8fbf">
        <geometry xsi:type="esdl:Point" lat="51.99818248979724" lon="4.37344640493393"/>
        <port xsi:type="esdl:InPort" connectedTo="d63c5508-228f-4245-ad0a-dfa9156a902e" name="In" id="2f452e85-1605-430a-a617-f5ed54cb5989" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="85aac4b2-ee22-4cac-9726-6dc5360c9bc8 2265fc97-11bf-41cf-940e-880fe18081a6" name="Out" id="1889d55b-e9c9-4418-92e5-1c6fba4ccc3e" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:HeatExchange" id="39179dff-ed97-45c4-a4b7-0a885c59faa7" name="HeatExchange_3917">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.999890004630885" lon="4.373379349708558"/>
        <port xsi:type="esdl:InPort" connectedTo="b33610cd-97b5-4d66-841f-13910920ab1a" name="PrimIn" id="01219fb1-1753-47e7-8abc-9fc1eb7d37ef" carrier="3be4c7f5-4282-440c-988e-06ff4e54f597"/>
        <port xsi:type="esdl:OutPort" connectedTo="65667491-b080-4aed-84a8-503b7b4dda7c" name="PrimOut" id="9e9f2b7f-5321-4dd0-8cb8-a224ec3cfbfd" carrier="3be4c7f5-4282-440c-988e-06ff4e54f597_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="ec0588a1-9955-4326-87c0-ee2700cdec07" name="SecOut" id="4fbc5cee-696e-42c8-a1bd-3e375b1cc71c" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:InPort" connectedTo="1c0be7db-0f4e-46f7-9938-9312c91e6d40" name="SecIn" id="c148e87a-1bc5-4a56-8960-dbe5856fb22c" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="811e1536-d7f9-4853-bfa0-06a8377d6442" name="HeatPump_811e">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.00103932030095" lon="4.3710458278656015"/>
        <port xsi:type="esdl:InPort" connectedTo="24c3aa52-caed-4fb5-b8d1-25a56e57e11d" name="PrimIn" id="804fe992-e102-4bca-bb60-7944ee32de49" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9"/>
        <port xsi:type="esdl:OutPort" connectedTo="b9359777-c334-4997-92b2-1bad1ca894f1" name="PrimOut" id="4522e76b-6aa8-4bdf-85af-b6d8cf05748d" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret"/>
        <port xsi:type="esdl:InPort" connectedTo="2fe6c4c6-f91e-43b4-8435-cf74782cf8a7" name="SecIn" id="1687df9e-4c47-47e3-a208-270462f5e825" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="cc84ed87-eb4f-4a26-b5ae-f432dee8299d" name="SecOut" id="cf151822-1dc3-49d1-8985-7048ac66a30c" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="107.05" id="Pipe4" name="Pipe4" related="Pipe4_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99877864115756" lon="4.372985064983369"/>
          <point xsi:type="esdl:Point" lat="51.99965221149765" lon="4.37232792377472"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="fe17169e-67d7-4de4-9480-f6fdc5a00a3e" name="In" id="758181aa-376b-4bc0-a9e8-0dd6f0b3e8e1" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="93d8042b-8a8d-4470-8599-f020470deec3" name="Out" id="f90ef2a7-675d-4de4-8d87-480aa502b7b3" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="282ad13c-91ee-4e51-a0db-2bd24cf8d789" name="Joint_282a">
        <geometry xsi:type="esdl:Point" lat="51.99965221149765" lon="4.37232792377472"/>
        <port xsi:type="esdl:InPort" connectedTo="f90ef2a7-675d-4de4-8d87-480aa502b7b3 29450227-4cd9-4463-bf4c-f260799680e5" name="In" id="93d8042b-8a8d-4470-8599-f020470deec3" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="1fece602-3c8c-4e23-a626-b5c555c45aad" name="Out" id="1fcf7c2c-bd53-4b4f-85bc-8ede724fde26" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="205.45" id="Pipe5" name="Pipe5" related="Pipe5_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99673253728782" lon="4.376678466796876"/>
          <point xsi:type="esdl:Point" lat="51.996336186743406" lon="4.374747276306153"/>
          <point xsi:type="esdl:Point" lat="51.99687786494158" lon="4.374350309371949"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="8ea38441-78d2-4479-9d78-9ac6d1d2ce1a" name="In" id="1c348008-565e-4670-a5f9-6ffc69a7d01b" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="21b35089-83d0-41a1-b5d5-c827a53956db" name="Out" id="3e7ae6d0-b36a-4cba-884f-5550f212e351" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="157.72" id="Pipe6" name="Pipe6" related="Pipe6_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99687786494158" lon="4.374350309371949"/>
          <point xsi:type="esdl:Point" lat="51.99810652534175" lon="4.373502731323243"/>
          <point xsi:type="esdl:Point" lat="51.99818248979724" lon="4.37344640493393"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="ab617325-03fd-45d6-88a2-db304ef1c3cb" name="In" id="6de4b5b4-026c-4f94-9bd0-d9336556fefa" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="2f452e85-1605-430a-a617-f5ed54cb5989" name="Out" id="d63c5508-228f-4245-ad0a-dfa9156a902e" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="05734efb-c631-4294-91f6-d27c221b0a96" name="Joint_0573">
        <geometry xsi:type="esdl:Point" lat="51.99687786494158" lon="4.374350309371949"/>
        <port xsi:type="esdl:InPort" connectedTo="212d3f29-13ab-4abc-9ca5-f5b381e634c0 3e7ae6d0-b36a-4cba-884f-5550f212e351" name="In" id="21b35089-83d0-41a1-b5d5-c827a53956db" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="6de4b5b4-026c-4f94-9bd0-d9336556fefa" name="Out" id="ab617325-03fd-45d6-88a2-db304ef1c3cb" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="72.62" id="Pipe7" name="Pipe7" related="Pipe7_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99965221149765" lon="4.37232792377472"/>
          <point xsi:type="esdl:Point" lat="52.00021366547689" lon="4.371786117553712"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="1fcf7c2c-bd53-4b4f-85bc-8ede724fde26" name="In" id="1fece602-3c8c-4e23-a626-b5c555c45aad" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="f7865935-a5da-4398-9124-3aa43a6691fc" name="Out" id="144f3d60-fc67-405a-808a-d006d32ac9fc" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="93.52" id="Pipe8" name="Pipe8" related="Pipe8_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.000950150313486" lon="4.371126294136048"/>
          <point xsi:type="esdl:Point" lat="52.00021366547689" lon="4.371786117553712"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="cf151822-1dc3-49d1-8985-7048ac66a30c" name="In" id="cc84ed87-eb4f-4a26-b5ae-f432dee8299d" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="f7865935-a5da-4398-9124-3aa43a6691fc" name="Out" id="2417dce6-2ae5-41dd-a847-a9fab55996b9" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="2bec564e-c47d-4450-b036-c65de6f1069c" name="Joint_2bec">
        <geometry xsi:type="esdl:Point" lat="52.00021366547689" lon="4.371786117553712"/>
        <port xsi:type="esdl:InPort" connectedTo="144f3d60-fc67-405a-808a-d006d32ac9fc 2417dce6-2ae5-41dd-a847-a9fab55996b9" name="In" id="f7865935-a5da-4398-9124-3aa43a6691fc" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="b64d122c-8699-47e4-9a6d-e0145dce3ac6" name="Out" id="3a4508b8-328d-4b78-b0e0-e5134b67b73c" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="72.2" id="Pipe9" name="Pipe9" related="Pipe9_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.000127796500934" lon="4.374361038208009"/>
          <point xsi:type="esdl:Point" lat="51.999890004630885" lon="4.373379349708558"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="5d14c302-77b0-4c38-9a3d-681ae8277884" name="In" id="c129e833-772a-41d7-8e13-3d1c4b3f6b77" carrier="3be4c7f5-4282-440c-988e-06ff4e54f597"/>
        <port xsi:type="esdl:OutPort" connectedTo="01219fb1-1753-47e7-8abc-9fc1eb7d37ef" name="Out" id="b33610cd-97b5-4d66-841f-13910920ab1a" carrier="3be4c7f5-4282-440c-988e-06ff4e54f597"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="66.7" id="Pipe10" name="Pipe10" related="Pipe10_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.00156773139614" lon="4.37058448791504"/>
          <point xsi:type="esdl:Point" lat="52.00103932030095" lon="4.3710458278656015"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="c8826d91-91b8-420d-aec8-9a59ebd5cb79" name="In" id="353948f3-a4d1-4120-9b48-2e45702d18a6" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9"/>
        <port xsi:type="esdl:OutPort" connectedTo="804fe992-e102-4bca-bb60-7944ee32de49" name="Out" id="24c3aa52-caed-4fb5-b8d1-25a56e57e11d" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="73.3" id="Pipe11" name="Pipe11" related="Pipe11_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.00021366547689" lon="4.371786117553712"/>
          <point xsi:type="esdl:Point" lat="51.99992963669694" lon="4.3708205223083505"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="3a4508b8-328d-4b78-b0e0-e5134b67b73c" name="In" id="b64d122c-8699-47e4-9a6d-e0145dce3ac6" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="05edfd66-58cb-4160-b17d-81cb24ae2d8a" name="Out" id="543f7bc3-ec95-4bce-a280-ad224b21e79f" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="76.7" id="Pipe12" name="Pipe12" related="Pipe12_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.999890004630885" lon="4.373379349708558"/>
          <point xsi:type="esdl:Point" lat="51.99965221149765" lon="4.37232792377472"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="4fbc5cee-696e-42c8-a1bd-3e375b1cc71c" name="In" id="ec0588a1-9955-4326-87c0-ee2700cdec07" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="93d8042b-8a8d-4470-8599-f020470deec3" name="Out" id="29450227-4cd9-4463-bf4c-f260799680e5" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="87.4" id="Pipe13" name="Pipe13" related="Pipe13_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.99992963669694" lon="4.3708205223083505"/>
          <point xsi:type="esdl:Point" lat="51.99959936840761" lon="4.369661808013917"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0413c46d-1361-49db-9b78-d209bf626a49" name="In" id="b22b4128-9d66-4b16-9adf-18b793b10ca1" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9"/>
        <port xsi:type="esdl:OutPort" connectedTo="634b8a0d-b532-4716-929e-dc18c103a8e4" name="Out" id="840b3ed8-1d93-4c0c-86e0-f92a3cf51098" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="167.9" id="Pipe14" name="Pipe14" related="Pipe14_ret" diameter="DN200">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.998317904376485" lon="4.370648860931397"/>
          <point xsi:type="esdl:Point" lat="51.99877864115756" lon="4.372985064983369"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="70e7154f-7a05-42ac-940e-6100b6f3efcd" name="In" id="59d26897-895d-4695-88bb-fbf1356a8e78" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
        <port xsi:type="esdl:OutPort" connectedTo="f665829f-1dd7-4d9c-8e29-0f2a4084cf0e" name="Out" id="169618d1-2db1-463f-94e0-36b5a8f1a87e" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="35bb0bef-8129-4904-9a55-5300e5c2950e" name="Joint_ff92_ret">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.998868641247554" lon="4.372198467776014"/>
        <port xsi:type="esdl:InPort" connectedTo="1c650436-fa83-496c-a2b4-26e01c40c0bd" name="ret_port" id="4d3acc63-cc4c-4252-b713-5dc253fa372f" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="e09f1314-f102-4c2c-9813-3671f5a49a31 d2fd8eb1-f117-481b-a7b9-4540418d4c67" name="ret_port" id="1e28e9eb-2cb3-4932-a49a-e7f2aec0aaeb" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="4bca66e2-92d1-47de-bbf0-0551ff715b52" name="Joint_8fbf_ret">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.998272489887235" lon="4.372656936860683"/>
        <port xsi:type="esdl:OutPort" connectedTo="2deedf70-eff5-48d2-bc78-2d54c0422ff9" name="ret_port" id="a058a1d0-0d9f-4645-b60c-21dc2a0cf67a" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:InPort" connectedTo="949a97f1-8832-4a98-9cc7-80b80cf60f50 04012d8b-f486-4258-8ba5-27c2913d78a2" name="ret_port" id="5df2e2e9-11d5-40e5-ad7c-11195bd1dd85" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="7067a514-0569-4148-aae3-547772e6fc86" name="Joint_282a_ret">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.999742211587645" lon="4.371545495375693"/>
        <port xsi:type="esdl:InPort" connectedTo="57954b34-e10d-402f-ad2e-7904864e53cb" name="ret_port" id="4dea40a3-57eb-4700-8489-db05bf543cdd" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="b8c4972e-f6b6-4ae9-910b-7077ff98d8e4 a4b2fefd-c5bc-4e06-9d73-4583367aaf82" name="ret_port" id="4354ee60-c6a5-433d-bdbb-b8048aced6d4" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="5b5bcd97-8ff2-4714-af80-771497d34b77" name="Joint_0573_ret">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.99696786503158" lon="4.373554483969099"/>
        <port xsi:type="esdl:OutPort" connectedTo="6772b5c0-412a-4c28-9ba9-378958db1012 d70b22e4-66cd-47f2-a031-189798413c2d" name="ret_port" id="8b43442e-79c7-4c19-8b1c-540569b2c694" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:InPort" connectedTo="5cd9ac8b-a202-40d7-bb85-ef65b84ed460" name="ret_port" id="f42dfb30-2be9-4342-9364-b9bddef91bf0" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="5f9f5272-b0aa-430e-bdd1-9b7f3e1e0ad9" name="Joint_2bec_ret">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.00030366556689" lon="4.371006344936896"/>
        <port xsi:type="esdl:OutPort" connectedTo="84ed5a37-abea-499c-86a3-812ee9afbbaa 850df741-7f26-4c62-a2ed-729bc5182594" name="ret_port" id="73d88995-4167-42b2-be82-b08ee3b3b237" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:InPort" connectedTo="e0425bf8-dace-4f91-b2bf-174d33009fc0" name="ret_port" id="6f01c805-e20e-422b-b9e8-0ee762b3965b" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="160.1" id="Pipe100" name="Pipe100" related="Pipe1" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99694969910065" lon="4.373498068326272"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.996439398574736" lon="4.371309552438089"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="8b43442e-79c7-4c19-8b1c-540569b2c694" name="In_ret" id="6772b5c0-412a-4c28-9ba9-378958db1012" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="5117c2be-331e-4a58-90e9-e060dcb2164f" name="Out_ret" id="cc9bdffe-7f12-4e2d-86c3-40cd994da3c0" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="179.9" id="Pipe2_ret" name="Pipe2_ret" related="Pipe200" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.997628439330356" lon="4.370156674775391"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998251021684645" lon="4.372584413437383"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="d92e513e-0802-4614-9fce-452a29610c2c" name="In_ret" id="9c024903-7c15-4c31-b489-53a89e72b8ba" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="5df2e2e9-11d5-40e5-ad7c-11195bd1dd85" name="Out_ret" id="04012d8b-f486-4258-8ba5-27c2913d78a2" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="73.43" id="Pipe3_ret" name="Pipe3_ret" related="Pipe3" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998868641247554" lon="4.372198467776014"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998272489887235" lon="4.372656936860683"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="1e28e9eb-2cb3-4932-a49a-e7f2aec0aaeb" name="In_ret" id="e09f1314-f102-4c2c-9813-3671f5a49a31" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="5df2e2e9-11d5-40e5-ad7c-11195bd1dd85" name="Out_ret" id="949a97f1-8832-4a98-9cc7-80b80cf60f50" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="107.05" id="Pipe4_ret" name="Pipe4_ret" related="Pipe4" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.999742211587645" lon="4.371545495375693"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998868641247554" lon="4.372198467776014"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="4354ee60-c6a5-433d-bdbb-b8048aced6d4" name="In_ret" id="b8c4972e-f6b6-4ae9-910b-7077ff98d8e4" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="4d3acc63-cc4c-4252-b713-5dc253fa372f" name="Out_ret" id="1c650436-fa83-496c-a2b4-26e01c40c0bd" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="205.45" id="Pipe5_ret" name="Pipe5_ret" related="Pipe5" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99696786503158" lon="4.373554483969099"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.9964261868334" lon="4.373948780767135"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99682253737782" lon="4.375881926796532"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="8b43442e-79c7-4c19-8b1c-540569b2c694" name="In_ret" id="d70b22e4-66cd-47f2-a031-189798413c2d" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="b8814ac1-2236-4871-a341-3cc022e26050" name="Out_ret" id="5119c93b-cf1b-4d3a-af34-756b4abdda77" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="157.72" id="Pipe6_ret" name="Pipe6_ret" related="Pipe6" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998272489887235" lon="4.372656936860683"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998196525431744" lon="4.372712895904377"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99696786503158" lon="4.373554483969099"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="a058a1d0-0d9f-4645-b60c-21dc2a0cf67a" name="In_ret" id="2deedf70-eff5-48d2-bc78-2d54c0422ff9" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="f42dfb30-2be9-4342-9364-b9bddef91bf0" name="Out_ret" id="5cd9ac8b-a202-40d7-bb85-ef65b84ed460" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="72.62" id="Pipe7_ret" name="Pipe7_ret" related="Pipe7" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00030366556689" lon="4.371006344936896"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.999742211587645" lon="4.371545495375693"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="73d88995-4167-42b2-be82-b08ee3b3b237" name="In_ret" id="84ed5a37-abea-499c-86a3-812ee9afbbaa" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="4dea40a3-57eb-4700-8489-db05bf543cdd" name="Out_ret" id="57954b34-e10d-402f-ad2e-7904864e53cb" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="93.52" id="Pipe8_ret" name="Pipe8_ret" related="Pipe8" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00030366556689" lon="4.371006344936896"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00104015040348" lon="4.37034997764605"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="73d88995-4167-42b2-be82-b08ee3b3b237" name="In_ret" id="850df741-7f26-4c62-a2ed-729bc5182594" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="1687df9e-4c47-47e3-a208-270462f5e825" name="Out_ret" id="2fe6c4c6-f91e-43b4-8435-cf74782cf8a7" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="72.2" id="Pipe9_ret" name="Pipe9_ret" related="Pipe9" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99998000472088" lon="4.372598048350767"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00021779659093" lon="4.37358086059924"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="9e9f2b7f-5321-4dd0-8cb8-a224ec3cfbfd" name="In_ret" id="65667491-b080-4aed-84a8-503b7b4dda7c" carrier="3be4c7f5-4282-440c-988e-06ff4e54f597_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="d07e6dc7-7e25-4c95-85e7-ae4803b66260" name="Out_ret" id="4918a956-cf1e-4173-9aa6-08a76ab9ff93" carrier="3be4c7f5-4282-440c-988e-06ff4e54f597_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="66.7" id="Pipe10_ret" name="Pipe10_ret" related="Pipe10" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.001129320390945" lon="4.370269927719944"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00165773148614" lon="4.369811045716992"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="4522e76b-6aa8-4bdf-85af-b6d8cf05748d" name="In_ret" id="b9359777-c334-4997-92b2-1bad1ca894f1" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="2f1c24db-5c69-4f2c-a3c7-e7b72696cffa" name="Out_ret" id="4048d690-dd3e-4ca5-a250-02ef9d57b8b2" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="73.3" id="Pipe11_ret" name="Pipe11_ret" related="Pipe11" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00001963678694" lon="4.370039408470301"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00030366556689" lon="4.371006344936896"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="886cb245-2998-4d69-9c68-b8a3b4e54eb2" name="In_ret" id="7b9faa39-33c2-45a1-9435-7599cd00d8f0" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="6f01c805-e20e-422b-b9e8-0ee762b3965b" name="Out_ret" id="e0425bf8-dace-4f91-b2bf-174d33009fc0" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="76.7" id="Pipe12_ret" name="Pipe12_ret" related="Pipe12" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.999742211587645" lon="4.371545495375693"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99998000472088" lon="4.372598048350767"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="4354ee60-c6a5-433d-bdbb-b8048aced6d4" name="In_ret" id="a4b2fefd-c5bc-4e06-9d73-4583367aaf82" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="c148e87a-1bc5-4a56-8960-dbe5856fb22c" name="Out_ret" id="1c0be7db-0f4e-46f7-9938-9312c91e6d40" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="87.4" id="Pipe13_ret" name="Pipe13_ret" related="Pipe13" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.999689368497606" lon="4.3688791287127415"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.00001963678694" lon="4.370039408470301"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="b88205af-1d25-4877-a045-d2481a2b148a" name="In_ret" id="9718fd37-5eb3-4e35-a47f-ef27569d1eba" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="924a166b-8581-4e28-bde4-36c6653c39a9" name="Out_ret" id="3163e284-2f59-45d0-ae19-400cdd2f6c47" carrier="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="167.9" id="Pipe14_ret" name="Pipe14_ret" related="Pipe14" diameter="DN200">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.998868641247554" lon="4.372198467776014"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99840790446648" lon="4.369860046832058"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="1e28e9eb-2cb3-4932-a49a-e7f2aec0aaeb" name="In_ret" id="d2fd8eb1-f117-481b-a7b9-4540418d4c67" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
        <port xsi:type="esdl:OutPort" connectedTo="d31f59a6-f002-4309-bc79-04d62a73b8f5" name="Out_ret" id="4331cef7-74ea-4c66-978b-81c68f636928" carrier="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="e34599a1-c660-422a-9653-c6adfbc8eac4">
    <carriers xsi:type="esdl:Carriers" id="c081ae3d-af0e-45dd-92e1-52deb64f688a">
      <carrier xsi:type="esdl:HeatCommodity" id="02ccd4ed-723b-40dd-811a-0ded707e8f7f" name="Primary" supplyTemperature="70.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9" name="Secondary" supplyTemperature="60.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="3be4c7f5-4282-440c-988e-06ff4e54f597" name="highT" supplyTemperature="100.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="02ccd4ed-723b-40dd-811a-0ded707e8f7f_ret" name="Primary_ret" returnTemperature="40.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="0fa1d0bc-c3e3-43cc-9a44-50942eeac0e9_ret" name="Secondary_ret" returnTemperature="35.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="3be4c7f5-4282-440c-988e-06ff4e54f597_ret" name="highT_ret" returnTemperature="60.0"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
