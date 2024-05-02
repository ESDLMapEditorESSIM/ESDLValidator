<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="e807b698-c195-49a4-9b85-b96ee4e36595" name="Unit Test Case 3B" version="2" description="Network with three heating demands served by geothermal well, ATES and boiler" esdlVersion="v2102">
    <services xsi:type="esdl:Services"/>
    <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="76122018-28c7-41c2-a9db-326e59e8b273">
        <notes xsi:type="esdl:Notes" id="76117233-b08a-4347-81ba-a133f3629810">
            <note xsi:type="esdl:Note" date="2021-02-12T00:27:38.734820" author="ESDLValidatorService" title="ERROR (Pipe8)" id="74e746c9-977c-42e5-99d9-a851f4e3226b" text="Pipe8 cannot be connected to Pipe14">
                <mapLocation xsi:type="esdl:Point" lat="51.988664955727444" lon="4.385397129350649"/>
            </note>
            <note xsi:type="esdl:Note" date="2021-02-12T00:27:38.734820" author="ESDLValidatorService" title="ERROR (Pipe22)" id="95d747d9-3668-47d1-947f-ad3f6318999e" text="Pipe22 cannot be connected to Pipe14">
                <mapLocation xsi:type="esdl:Point" lat="51.98509306333025" lon="4.3841176561629585"/>
            </note>
            <note xsi:type="esdl:Note" date="2021-02-12T00:27:38.734820" author="ESDLValidatorService" title="ERROR (Pipe14)" id="a395ef26-ff02-4a61-8ad4-f8fdd84ce2cc" text="Pipe14 cannot be connected to Pipe8">
                <mapLocation xsi:type="esdl:Point" lat="51.98571845966741" lon="4.387703804535475"/>
            </note>
            <note xsi:type="esdl:Note" date="2021-02-12T00:27:38.734820" author="ESDLValidatorService" title="ERROR (SupplyJoint4)" id="f015ddf3-7d11-4fea-876a-0be731b55bb3" text="SupplyJoint4 cannot be connected to a7a2f032-09a7-427b-a38b-8f4903f51adb">
                <mapLocation xsi:type="esdl:Point" lat="51.98584071071235" lon="4.386671036481858"/>
            </note>
            <note xsi:type="esdl:Note" date="2021-02-12T00:27:38.734820" author="ESDLValidatorService" title="ERROR (a7a2f032-09a7-427b-a38b-8f4903f51adb)" id="ce7bd281-2892-4885-af8b-46ca6d9e2260" text="a7a2f032-09a7-427b-a38b-8f4903f51adb cannot be connected to SupplyJoint4">
                <mapLocation xsi:type="esdl:Point" lat="51.986035755616065" lon="4.386731386184693"/>
            </note>
            <note xsi:type="esdl:Note" date="2021-02-12T00:27:38.734820" author="ESDLValidatorService" title="ERROR (Pipe5)" id="dab106da-d294-4a44-8b6b-6babca028679" text="One of diameter or innerDiameter must be defined">
                <mapLocation xsi:type="esdl:Point" lat="51.9893630660449" lon="4.382619547663667"/>
            </note>
            <note xsi:type="esdl:Note" date="2021-02-12T00:27:38.734820" author="ESDLValidatorService" title="WARNING (a7a2f032-09a7-427b-a38b-8f4903f51adb)" id="c910a1fc-67bc-4597-81da-d211e4107694" text="a7a2f032-09a7-427b-a38b-8f4903f51adb's InPort is unconnected">
                <mapLocation xsi:type="esdl:Point" lat="51.9860360870702" lon="4.390847754542084"/>
            </note>
        </notes>
        <carriers xsi:type="esdl:Carriers" id="5bb2c688-a9d0-4e89-b5f7-ef2315b6b211">
            <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="80.0" name="Heat Supply" id="HeatSupply"/>
            <carrier xsi:type="esdl:GasCommodity" name="Natural Gas" id="NaturalGas"/>
            <carrier xsi:type="esdl:HeatCommodity" name="Heat Return" id="HeatReturn" returnTemperature="40.0"/>
        </carriers>
        <matters xsi:type="esdl:Matters" id="17dae58b-0409-4a88-984a-0329fd71f50a">
            <matter xsi:type="esdl:CompoundMatter" name="LOGSTOR DN100" id="db89f983-b06f-4a9a-8c6c-4f0e06192b64" compoundType="LAYERED">
                <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
                    <matter xsi:type="esdl:Material" name="Steel" thermalConductivity="0.00019856553205188594" id="21bf6e98-a611-491f-a9d4-9d3d9e0b454f"/>
                </component>
                <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03965">
                    <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="3.1062777419455947" id="35c3cfec-cc33-4a10-af59-4bf36ae57b2e"/>
                </component>
                <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0032">
                    <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.01294056681266307" id="3be8483e-91a4-4ddc-8782-643313a37329"/>
                </component>
            </matter>
        </matters>
        <environmentalProfiles xsi:type="esdl:EnvironmentalProfiles" id="130a7569-239a-4456-80bf-614af8934b9c">
            <soilTemperatureProfile xsi:type="esdl:InfluxDBProfile" host="https://wu-profiles.esdl-beta.hesi.energy" name="Soil Temperature Profile" id="4fed9d00-23f2-4c3d-a63b-b061ba699ebb" measurement="Unittests profiledata" endDate="2020-01-01T00:00:00.000000+0000" startDate="2019-01-01T01:00:00.000000+0000" port="443" field="soilTemperature_oC" database="energy_profiles"/>
        </environmentalProfiles>
    </energySystemInformation>
    <instance xsi:type="esdl:Instance" name="Untitled instance" id="f659763c-5c50-4e81-9998-1d1df9d3bf9a">
        <area xsi:type="esdl:Area" name="WarmingUP_TestArea" id="ec44918e-b0cb-4a23-b35b-5bcf3cca9971">
            <asset xsi:type="esdl:HeatingDemand" technicalLifetime="15.0" name="DemandCluster1" id="DemandCluster1">
                <port xsi:type="esdl:InPort" connectedTo="e85db14d-caeb-4c08-bc72-0632435d227f" carrier="HeatSupply" id="7ae22988-9598-47b6-b94b-60712a057587" name="In">
                    <profile xsi:type="esdl:InfluxDBProfile" host="https://wu-profiles.esdl-beta.hesi.energy" id="fdeaf4f4-8cbe-45c6-9900-daa281683f62" measurement="Unittests profiledata" endDate="2020-01-01T00:00:00.000000+0000" filters="" startDate="2019-01-01T01:00:00.000000+0000" port="443" field="demand1_MW" database="energy_profiles">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATT" physicalQuantity="POWER" description="Power in MW" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" multiplier="MEGA"/>
                    </profile>
                </port>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="f93cbaa0-76d2-4be8-9ae4-c4e7e9d6dac9" connectedTo="54a7c49c-806b-4569-95c2-38fcdfe12eae" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.99151695729458" lon="4.375503659248353"/>
                <costInformation xsi:type="esdl:CostInformation" id="87fb3c5d-42d2-4e31-b112-473fd9ed3bef">
                    <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="b06bfba6-da5d-462f-b4a0-0aadb6451fce" value="10000.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" description="Cost in EUR/yr" id="6d620202-a570-4572-85f0-aaca7df5568f" perTimeUnit="YEAR"/>
                    </fixedMaintenanceCosts>
                    <installationCosts xsi:type="esdl:SingleValue" id="6f74b04e-5d63-464a-afbe-4607df839877" value="100000.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d115ff5b-deb3-41ee-996e-8bf94fd87cb9" physicalQuantity="COST" unit="EURO" description="Cost in EUR"/>
                    </installationCosts>
                    <variableOperationalCosts xsi:type="esdl:SingleValue" id="1b45a05f-a23e-4cae-84dc-c1c3dead558a" value="25.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="JOULE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/GJ" id="e2f62076-af30-4c61-bc4b-faa4b37a932b" perMultiplier="GIGA"/>
                    </variableOperationalCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:HeatingDemand" technicalLifetime="15.0" name="DemandCluster2" id="DemandCluster2">
                <port xsi:type="esdl:InPort" connectedTo="284ea711-01c2-4cc1-a365-ebcd67eb1326" carrier="HeatSupply" id="07922681-c0f5-4a04-9e36-68afdb6efddb" name="In">
                    <profile xsi:type="esdl:InfluxDBProfile" host="https://wu-profiles.esdl-beta.hesi.energy" id="ba695b92-b91c-403c-8b1a-572378a86b85" measurement="Unittests profiledata" endDate="2020-01-01T00:00:00.000000+0000" filters="" startDate="2019-01-01T01:00:00.000000+0000" port="443" field="demand4_MW" database="energy_profiles">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATT" physicalQuantity="POWER" description="Power in MW" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" multiplier="MEGA"/>
                    </profile>
                </port>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="7de3c006-ed3c-4ef8-ae45-726395b80b9e" connectedTo="79798b42-c866-4bdc-9c62-1d9fe8ba5e43" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.988002123047075" lon="4.379677176475526"/>
                <costInformation xsi:type="esdl:CostInformation" id="1d02f22e-dd46-49b9-af66-7fc3f09021e4">
                    <variableMaintenanceCosts xsi:type="esdl:SingleValue" id="58937e4d-84f6-4ad0-a0dd-dd7ca05e8e7c" value="10000.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" description="Cost in EUR/yr" id="c3dc9db1-7f7e-4bc7-9f54-78ca20a314ca" perTimeUnit="YEAR"/>
                    </variableMaintenanceCosts>
                    <installationCosts xsi:type="esdl:SingleValue" id="c2bf2f73-9c7b-4f7b-bc56-3140cc7defc9" value="100000.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="f53e1ae2-62ca-4060-bf02-e10b1f5d4f6b" physicalQuantity="COST" unit="EURO" description="Cost in EUR"/>
                    </installationCosts>
                    <variableOperationalCosts xsi:type="esdl:SingleValue" id="9eacd38b-9cad-487f-903d-b139a113266c" value="25.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="JOULE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/GJ" id="6c5fc663-9495-45ac-9ba3-92b91bd66b1f" perMultiplier="GIGA"/>
                    </variableOperationalCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:HeatingDemand" technicalLifetime="15.0" name="DemandCluster3" id="DemandCluster3">
                <port xsi:type="esdl:InPort" connectedTo="6ac8f22a-202a-4ac1-94de-74f1e7fb3dd1" carrier="HeatSupply" id="76235222-f7e2-4b75-b3ec-866adef4e821" name="In">
                    <profile xsi:type="esdl:InfluxDBProfile" host="https://wu-profiles.esdl-beta.hesi.energy" id="9ad97078-8beb-4492-9aa5-ce7ceea8e9ae" measurement="Unittests profiledata" endDate="2020-01-01T00:00:00.000000+0000" filters="" startDate="2019-01-01T01:00:00.000000+0000" port="443" field="demand5_MW" database="energy_profiles">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATT" physicalQuantity="POWER" description="Power in MW" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" multiplier="MEGA"/>
                    </profile>
                </port>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="a6ab318d-80b2-4152-be72-bd8ea23ddedc" connectedTo="15ecad94-e93e-43f7-bdd9-06df3283e0fc" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.985481558670855" lon="4.38905417919159"/>
                <costInformation xsi:type="esdl:CostInformation" id="c8887142-7046-442c-bf2b-90dc60811188">
                    <variableMaintenanceCosts xsi:type="esdl:SingleValue" id="f61e77e5-92d6-4715-b889-00c71778c1a5" value="10000.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" description="Cost in EUR/yr" id="9910b3e2-b2fe-481c-b3b8-ce961c60242f" perTimeUnit="YEAR"/>
                    </variableMaintenanceCosts>
                    <installationCosts xsi:type="esdl:SingleValue" id="c3167f72-fdfb-4c2e-bd88-0c8216ec8145" value="100000.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b92e13ae-9683-4a69-adf2-399a3c210b05" physicalQuantity="COST" unit="EURO" description="Cost in EUR"/>
                    </installationCosts>
                    <variableOperationalCosts xsi:type="esdl:SingleValue" id="8ee3adc8-4ce9-4b4a-a536-a6ff36a4fcbb" value="25.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="JOULE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/GJ" id="3df59212-3177-4469-ac3b-56a9e337dd2e" perMultiplier="GIGA"/>
                    </variableOperationalCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:GeothermalSource" technicalLifetime="15.0" power="3500000.0" name="ProductionCluster1" id="ProductionCluster1">
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="b2b92660-f268-47c6-b4b2-4231e7a51459" connectedTo="92fba996-ca7b-4aa6-a995-b39f6951a83e" name="Out"/>
                <port xsi:type="esdl:InPort" connectedTo="0a8f0f59-2843-4f53-bc5f-e172aaea6bf0" carrier="HeatReturn" id="eb0aaa4a-c61a-4930-ac69-1d3b7ba21c53" name="In"/>
                <geometry xsi:type="esdl:Point" lat="51.99287461411067" lon="4.385647773742677"/>
                <costInformation xsi:type="esdl:CostInformation" id="9b8a4262-93e6-4273-9685-567d6b9ab83e">
                    <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="90f49c55-8a53-4216-b48c-a76002f1f932" value="30000.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" description="Cost in EUR/yr" id="3f032157-1976-4882-a97a-dc4000e58ef7" perTimeUnit="YEAR"/>
                    </fixedMaintenanceCosts>
                    <installationCosts xsi:type="esdl:SingleValue" id="6c589f91-6596-4c48-a595-77002b827b52" value="1000000.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="121e04ec-3c50-46cc-b524-81f6f999d721" physicalQuantity="COST" unit="EURO" description="Cost in EUR"/>
                    </installationCosts>
                    <variableOperationalCosts xsi:type="esdl:SingleValue" id="937401c7-1b55-4ec9-bcff-e1e02fee9606" value="10.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="JOULE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/GJ" id="0bd0cfdc-7387-4b59-976f-ecc55edbfebd" perMultiplier="GIGA"/>
                    </variableOperationalCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:UTES" maxDischargeRate="10000000.0" capacity="29302000000.0" maxChargeRate="10000000.0" name="BufferCluster1" id="BufferCluster1">
                <port xsi:type="esdl:InPort" connectedTo="3b3c823f-cd14-49ea-a6ea-f833da8a1b7d" carrier="HeatSupply" id="4cf8786d-049d-4e5b-8964-3817b97858ca" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="3a16afe3-fbfc-466f-add9-e98584f20a43" connectedTo="a8261fb2-6b95-48aa-9c81-69a860fd5921" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.989022698049844" lon="4.387439489364625"/>
            </asset>
            <asset xsi:type="esdl:Joint" name="SupplyJoint2" id="SupplyJoint2">
                <port xsi:type="esdl:InPort" connectedTo="95be88bf-dd5c-4b10-8823-9b435ac8dca0" carrier="HeatSupply" id="dc3263ed-c38b-4a97-8522-a575712b5255" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="1e92f4cb-6d4f-4094-b649-8dd3a3d7e1f4" connectedTo="eb92e1f2-ee85-4b9c-800f-b88b49120369 d276b89d-d29d-4812-a2ea-07cf2a466096 6118e7d2-9e3c-422a-9488-cd2c56348b4e c3633497-dec6-4084-96bd-0fe8e611819f" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.991131296422445" lon="4.384552091360093"/>
            </asset>
            <asset xsi:type="esdl:Joint" name="SupplyJoint1" id="SupplyJoint1">
                <port xsi:type="esdl:InPort" connectedTo="b9ced6a5-718c-4558-9973-fec8ca93908e 28bb7d60-4311-4ea3-9cd9-c1971b5fb404" carrier="HeatSupply" id="db3cd7f7-c22a-416b-942b-f510591576ea" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="c3c38e70-c672-4ed0-8b43-5388eb144cdd" connectedTo="1ab7760c-3994-48c4-bc60-5d0022b45ea8" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.991009898500714" lon="4.37794715166092"/>
            </asset>
            <asset xsi:type="esdl:Joint" name="SupplyJoint3" id="SupplyJoint3">
                <port xsi:type="esdl:InPort" connectedTo="13b04748-7608-466f-95cc-3eeee7b2720e 40b48712-44a5-4402-8ab6-889764a8d5bc" carrier="HeatSupply" id="bc731861-2be1-4ee0-80f4-b8feb27747be" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="19a4dc27-f87a-451a-8825-1ecb886d0a12" connectedTo="9b08fde6-dbb0-4a48-82c8-7f21f7eb2006" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.987988890631804" lon="4.381876587867738"/>
            </asset>
            <asset xsi:type="esdl:Joint" name="SupplyJoint4" id="SupplyJoint4">
                <port xsi:type="esdl:InPort" connectedTo="4b1b236d-65af-4ded-a60c-dc1f966d569b d9617199-bbc9-4cda-bed6-91f4ad2c5560 8addf7f1-9c31-4884-b19e-316576aabc69" carrier="HeatSupply" id="7abadf5a-0e24-4b70-8eb2-91d9a58123e1" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="34158152-401c-4afd-885c-2920ddf92527" connectedTo="2098b217-80b3-4b58-9398-f1311a07bf4b" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.98584071071236" lon="4.386671036481858"/>
            </asset>
            <asset xsi:type="esdl:Joint" name="SupplyJoint5" id="SupplyJoint5">
                <port xsi:type="esdl:InPort" connectedTo="8452c654-6f4c-460b-8342-52bd6df055ec" carrier="HeatSupply" id="edb95a74-9f5b-47ba-a561-c1d5c8db6888" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="5ecf0847-22ff-471e-a568-cdf5ff6e56c2" connectedTo="94204833-4b32-4b70-bcfb-715d82edefa9 b7272a56-6823-4b5a-b9c2-c2eb4bc034cd fdd1413c-756d-439d-9fcf-a9e19846c4de" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.984546463842356" lon="4.381447434425355"/>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="100.0" name="Pipe1" id="Pipe1">
                <port xsi:type="esdl:InPort" connectedTo="ff998fa2-1263-46b4-af45-859735b1042d" carrier="HeatSupply" id="2fb1015e-7d0f-4c3d-a409-440f748dadbe" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="95be88bf-dd5c-4b10-8823-9b435ac8dca0" connectedTo="dc3263ed-c38b-4a97-8522-a575712b5255" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.99254426590507" lon="4.384349584579469"/>
                    <point xsi:type="esdl:Point" lat="51.992381030045244" lon="4.383673667907716"/>
                    <point xsi:type="esdl:Point" lat="51.991191490175964" lon="4.384489059448243"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="9e984102-f57c-449e-907e-0e2585004959" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="a4474ad9-3415-4de2-85f3-3842a8dcca33">
                    <installationCosts xsi:type="esdl:SingleValue" id="8ab12266-6675-43da-a48b-879d584bfd40" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="1133019b-c326-4d4d-8853-4c0ae56eed18"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="400.0" name="Pipe23" id="Pipe23">
                <port xsi:type="esdl:InPort" connectedTo="1e92f4cb-6d4f-4094-b649-8dd3a3d7e1f4" carrier="HeatSupply" id="eb92e1f2-ee85-4b9c-800f-b88b49120369" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="c494d97f-572c-4337-9ef5-615b9d94e7a1" connectedTo="8a9ab2fb-5a65-4805-9ca1-58cbb62b123a" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.99111410156213" lon="4.384746551513673"/>
                    <point xsi:type="esdl:Point" lat="51.99135201247523" lon="4.3856263160705575"/>
                    <point xsi:type="esdl:Point" lat="51.989554522183155" lon="4.386881589889527"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="c3ce549f-d06b-493b-9fb5-4b153d7bcf6d" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="31dae54c-687d-4180-b0b8-0cfa1f603889">
                    <installationCosts xsi:type="esdl:SingleValue" id="23b98169-809a-4ba5-bae8-92a089dc0580" value="1700.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="08c95618-ebbb-44f5-a572-4b8728c382e8"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="1000.0" name="Pipe3" id="Pipe3">
                <port xsi:type="esdl:InPort" connectedTo="1e92f4cb-6d4f-4094-b649-8dd3a3d7e1f4" carrier="HeatSupply" id="c3633497-dec6-4084-96bd-0fe8e611819f" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="b9ced6a5-718c-4558-9973-fec8ca93908e" connectedTo="db3cd7f7-c22a-416b-942b-f510591576ea" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.991155266860936" lon="4.384360313415528"/>
                    <point xsi:type="esdl:Point" lat="51.991645788292274" lon="4.3840277194976816"/>
                    <point xsi:type="esdl:Point" lat="51.99076032698196" lon="4.380776882171632"/>
                    <point xsi:type="esdl:Point" lat="51.99157312005638" lon="4.380251169204713"/>
                    <point xsi:type="esdl:Point" lat="51.99103784349845" lon="4.378223419189454"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="922dc8bc-1162-46a1-b3ba-3f3b3a72b3f6" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="cbe71754-cfa5-4b65-b068-95c3eb4ee386">
                    <installationCosts xsi:type="esdl:SingleValue" id="16e87d4b-577c-4d54-a4c2-1a60358ed214" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="f7e2d8ba-be41-43e8-b8ec-dddf17b9fcc6"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="750.0" name="Pipe7" id="Pipe7">
                <port xsi:type="esdl:InPort" connectedTo="1e92f4cb-6d4f-4094-b649-8dd3a3d7e1f4" carrier="HeatSupply" id="d276b89d-d29d-4812-a2ea-07cf2a466096" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="d9617199-bbc9-4cda-bed6-91f4ad2c5560" connectedTo="7abadf5a-0e24-4b70-8eb2-91d9a58123e1" name="Out"/>
                <geometry xsi:type="esdl:Line" CRS="WGS84">
                    <point xsi:type="esdl:Point" lat="51.990965041389956" lon="4.384682178497315"/>
                    <point xsi:type="esdl:Point" lat="51.98914100965691" lon="4.385948181152345"/>
                    <point xsi:type="esdl:Point" lat="51.988770907194926" lon="4.384531974792481"/>
                    <point xsi:type="esdl:Point" lat="51.985862852847774" lon="4.386506080627442"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="ca4e4700-2a7c-4350-a4c8-c7806a047df8" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="3491f322-da54-4f09-aa04-645ad8b2ad48">
                    <installationCosts xsi:type="esdl:SingleValue" id="f1befbe2-8a61-4d3c-96a1-6ec5a654276c" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="4bc022a6-d15f-43e7-bf48-912a47ba267c"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" length="500.0" name="Pipe5" id="Pipe5">
                <port xsi:type="esdl:InPort" connectedTo="1e92f4cb-6d4f-4094-b649-8dd3a3d7e1f4" carrier="HeatSupply" id="6118e7d2-9e3c-422a-9488-cd2c56348b4e" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="40b48712-44a5-4402-8ab6-889764a8d5bc" connectedTo="bc731861-2be1-4ee0-80f4-b8feb27747be" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.99104361310311" lon="4.384338855743409"/>
                    <point xsi:type="esdl:Point" lat="51.990192489692646" lon="4.381227493286134"/>
                    <point xsi:type="esdl:Point" lat="51.9881639797825" lon="4.3826544284820566"/>
                    <point xsi:type="esdl:Point" lat="51.98805216032075" lon="4.3822574615478525"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="f44148d5-c548-412b-8b58-f858067c3c96" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="efc75637-befd-46c5-99d9-a6885e970a09">
                    <installationCosts xsi:type="esdl:SingleValue" id="d231b267-69e3-4701-81f3-da9bfe335047" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="202f2cc9-d6ff-4a75-b359-fbeec2c25745"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" length="400.0" innerDiameter="0.201" name="Pipe21" id="Pipe21">
                <port xsi:type="esdl:InPort" connectedTo="5ecf0847-22ff-471e-a568-cdf5ff6e56c2" carrier="HeatSupply" id="fdd1413c-756d-439d-9fcf-a9e19846c4de" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="4b1b236d-65af-4ded-a60c-dc1f966d569b" connectedTo="7abadf5a-0e24-4b70-8eb2-91d9a58123e1" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.98447042292743" lon="4.381774663925172"/>
                    <point xsi:type="esdl:Point" lat="51.98575565644573" lon="4.3865007162094125"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="8e05e41d-1daf-4e1a-9725-4893379a2f77" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="aeb33c71-be0c-41b4-b6a1-49bfae28b083">
                    <installationCosts xsi:type="esdl:SingleValue" id="331cbe66-f4df-46a2-997d-7cb6aebad568" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="32885572-9e1d-4756-9aff-202c3126dc38"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" length="500.0" innerDiameter="0.201" name="Pipe17" id="Pipe17">
                <port xsi:type="esdl:InPort" connectedTo="5ecf0847-22ff-471e-a568-cdf5ff6e56c2" carrier="HeatSupply" id="94204833-4b32-4b70-bcfb-715d82edefa9" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="13b04748-7608-466f-95cc-3eeee7b2720e" connectedTo="bc731861-2be1-4ee0-80f4-b8feb27747be" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.9846290236916" lon="4.381688833236695"/>
                    <point xsi:type="esdl:Point" lat="51.98594556188314" lon="4.380798339843751"/>
                    <point xsi:type="esdl:Point" lat="51.98659806902809" lon="4.383287429809571"/>
                    <point xsi:type="esdl:Point" lat="51.987901906527235" lon="4.382343292236329"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="d3bd9f03-0110-4c24-b64c-cfabdd36daa3" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="0837c541-71c4-424b-8805-84479371cc8b">
                    <installationCosts xsi:type="esdl:SingleValue" id="32fe1e99-2662-4f3b-ad2a-99c71b7e5b57" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="9d11f54a-ad88-4149-ac3d-23948a4f78cb"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="300.0" name="Pipe19" id="Pipe19">
                <port xsi:type="esdl:InPort" connectedTo="5ecf0847-22ff-471e-a568-cdf5ff6e56c2" carrier="HeatSupply" id="b7272a56-6823-4b5a-b9c2-c2eb4bc034cd" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="28bb7d60-4311-4ea3-9cd9-c1971b5fb404" connectedTo="db3cd7f7-c22a-416b-942b-f510591576ea" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.984526610821945" lon="4.381243586540223"/>
                    <point xsi:type="esdl:Point" lat="51.9898052949675" lon="4.377622604370118"/>
                    <point xsi:type="esdl:Point" lat="51.99006015676558" lon="4.378652572631837"/>
                    <point xsi:type="esdl:Point" lat="51.99083626326097" lon="4.3781375885009775"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="6b65d92b-126f-44c1-9bec-539c0ea7151b" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="779d9cf4-720f-46bc-9117-e11336b87088">
                    <installationCosts xsi:type="esdl:SingleValue" id="38ac617f-d839-4c7f-84b7-41eb714d8966" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="ee8b3058-931f-4ba1-ac51-ee4dcccc6744"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="1000.0" name="Pipe4" id="Pipe4">
                <port xsi:type="esdl:InPort" connectedTo="399facac-007e-4218-97ce-b9a0668eb4d6" carrier="HeatReturn" id="3fce9c49-a999-471f-b090-588aed143a02" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="6431ad64-8df1-4416-86d7-2ccc88ee0348" connectedTo="757fe809-0d26-4011-b01a-a4c7d27ac434" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.99101784349845" lon="4.378203419189454"/>
                    <point xsi:type="esdl:Point" lat="51.99155312005638" lon="4.380231169204713"/>
                    <point xsi:type="esdl:Point" lat="51.990740326981964" lon="4.380756882171632"/>
                    <point xsi:type="esdl:Point" lat="51.991625788292275" lon="4.384007719497681"/>
                    <point xsi:type="esdl:Point" lat="51.99113526686094" lon="4.384340313415528"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="0b09274a-7b26-4602-8722-013e6570aada" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="a05de5f0-25ec-41f3-8504-d1c6e1b9b460">
                    <installationCosts xsi:type="esdl:SingleValue" id="1efcae4e-599a-4dab-8cc0-9eae579c4e0c" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="9065dc3f-c33e-4bb0-b0c4-e482909fc7d7"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="300.0" name="Pipe20" id="Pipe20">
                <port xsi:type="esdl:InPort" connectedTo="399facac-007e-4218-97ce-b9a0668eb4d6" carrier="HeatReturn" id="3222f21d-e2e0-4363-871e-019a55bebd7f" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="8605ce4b-068f-4541-9582-7da47b330679" connectedTo="9d334c5d-2c45-4833-afbe-a580d9c43d6e" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.99081626326097" lon="4.378117588500977"/>
                    <point xsi:type="esdl:Point" lat="51.99004015676558" lon="4.378632572631837"/>
                    <point xsi:type="esdl:Point" lat="51.989785294967504" lon="4.377602604370118"/>
                    <point xsi:type="esdl:Point" lat="51.984506610821946" lon="4.381223586540223"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="1a948a14-74ae-48dc-a9ef-eb5cf26044e6" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="63f48dd4-828c-46e2-9e2f-8b41075fa688">
                    <installationCosts xsi:type="esdl:SingleValue" id="c6afda97-67f0-476e-90ae-1f47abf85596" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="a1282d46-45a9-4232-896c-38dac298228c"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="500.0" name="Pipe6" id="Pipe6">
                <port xsi:type="esdl:InPort" connectedTo="6b3b5bf7-7b5a-4b98-bb30-7a5299bc51cd" carrier="HeatReturn" id="f686ec46-fc9c-424d-b662-30f5cb766f2b" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="b8a5669a-5ff7-40ba-93e6-9276ec39d782" connectedTo="757fe809-0d26-4011-b01a-a4c7d27ac434" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.98803216032075" lon="4.382237461547852"/>
                    <point xsi:type="esdl:Point" lat="51.9881439797825" lon="4.382634428482056"/>
                    <point xsi:type="esdl:Point" lat="51.99017248969265" lon="4.381207493286134"/>
                    <point xsi:type="esdl:Point" lat="51.99102361310311" lon="4.384318855743409"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="03404827-b9de-49a9-bc15-c3cc486da2c0" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="d1d204c2-c11f-4b5d-a87f-dfb5e29feb26">
                    <installationCosts xsi:type="esdl:SingleValue" id="e98acf41-f896-4222-bf24-4a52444dd4a6" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="6c6c14bd-8a46-4e52-b793-3e9666d631c7"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="100.0" name="Pipe2" id="Pipe2">
                <port xsi:type="esdl:InPort" connectedTo="dda28c21-dffc-40e5-af62-697cca59ca26" carrier="HeatReturn" id="314c9618-2d1f-4374-82df-a1fd478f9560" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="0a8f0f59-2843-4f53-bc5f-e172aaea6bf0" connectedTo="eb0aaa4a-c61a-4930-ac69-1d3b7ba21c53" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.991171490175965" lon="4.384469059448243"/>
                    <point xsi:type="esdl:Point" lat="51.992361030045245" lon="4.383653667907716"/>
                    <point xsi:type="esdl:Point" lat="51.99252426590507" lon="4.3843295845794685"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="e11e51d0-02aa-4705-994b-07c73adf5cff" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="2ebe655a-a520-49b5-a4e1-b5dc3b423d0f">
                    <installationCosts xsi:type="esdl:SingleValue" id="f8590e55-078c-4e9b-a77b-e413b4033dd5" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="94266e8e-d2a3-44a2-b835-ba51a7d963cf"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="400.0" name="Pipe24" id="Pipe24">
                <port xsi:type="esdl:InPort" connectedTo="3a16afe3-fbfc-466f-add9-e98584f20a43" carrier="HeatReturn" id="a8261fb2-6b95-48aa-9c81-69a860fd5921" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="ac18e5ff-63a4-4cf5-b43a-a048f651bd08" connectedTo="757fe809-0d26-4011-b01a-a4c7d27ac434" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.989528092789925" lon="4.3868494033813485"/>
                    <point xsi:type="esdl:Point" lat="51.99133201247523" lon="4.385606316070557"/>
                    <point xsi:type="esdl:Point" lat="51.99109410156213" lon="4.384726551513673"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="8590651e-5556-46f9-8e6f-97f1936b6a8f" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="514a95dc-3711-44a6-bf29-a70e29ce2c42">
                    <installationCosts xsi:type="esdl:SingleValue" id="04e44c27-1d23-4f4c-98c6-19f3e41d7f26" value="1700.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="8a7cd830-098b-4cb3-9acb-b0835705375d"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="750.0" name="Pipe8" id="Pipe8">
                <port xsi:type="esdl:InPort" connectedTo="851f1ce6-d560-4d70-b634-bfad084d40e0" carrier="HeatReturn" id="12f52dd0-4416-4899-8cec-b66e8661ed07" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="f7d757c9-07af-43ba-9f88-a915ad61a9f3" connectedTo="757fe809-0d26-4011-b01a-a4c7d27ac434" name="Out"/>
                <geometry xsi:type="esdl:Line" CRS="WGS84">
                    <point xsi:type="esdl:Point" lat="51.985842852847775" lon="4.386486080627442"/>
                    <point xsi:type="esdl:Point" lat="51.98875090719493" lon="4.384511974792481"/>
                    <point xsi:type="esdl:Point" lat="51.98912100965691" lon="4.3859281811523445"/>
                    <point xsi:type="esdl:Point" lat="51.990945041389956" lon="4.384662178497315"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="2fc066b3-50a3-497d-ac0d-7eb3bf46f77c" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="5619250e-7b1b-4183-93b9-3754a5ab2e21">
                    <installationCosts xsi:type="esdl:SingleValue" id="697d287c-16f2-4805-83a8-9a5d5b40a201" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="ec21321f-c320-4353-becf-ee8ba3f7a0ae"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="500.0" name="Pipe18" id="Pipe18">
                <port xsi:type="esdl:InPort" connectedTo="6b3b5bf7-7b5a-4b98-bb30-7a5299bc51cd" carrier="HeatReturn" id="84e76433-b5d4-4f4d-91e7-8f3234cf75e6" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="948ba2aa-64ff-4272-8424-235bd596201f" connectedTo="9d334c5d-2c45-4833-afbe-a580d9c43d6e" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.987881906527235" lon="4.382323292236329"/>
                    <point xsi:type="esdl:Point" lat="51.98657806902809" lon="4.383267429809571"/>
                    <point xsi:type="esdl:Point" lat="51.98592556188314" lon="4.380778339843751"/>
                    <point xsi:type="esdl:Point" lat="51.984609023691604" lon="4.381668833236695"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="bbb42a79-f1e5-4338-9e50-58d178a32428" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="677d6726-2079-4a48-a2d7-113daf9333c8">
                    <installationCosts xsi:type="esdl:SingleValue" id="d3b17354-a4a8-46ea-a742-313a267506ba" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="3bdb8aaf-5666-4a7b-b5cb-55378c2a70cd"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="400.0" name="Pipe22" id="Pipe22">
                <port xsi:type="esdl:InPort" connectedTo="851f1ce6-d560-4d70-b634-bfad084d40e0" carrier="HeatReturn" id="71a05dd4-7586-49f2-8b88-4ff9d55d0eba" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="32dce824-6ab5-4040-933c-8a2b32bfb369" connectedTo="9d334c5d-2c45-4833-afbe-a580d9c43d6e" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.98573565644573" lon="4.386480716209412"/>
                    <point xsi:type="esdl:Point" lat="51.98445042292743" lon="4.381754663925172"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="5664a199-dc11-4e81-9d8c-7f9857883841" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="709c47fb-2a16-43dd-9ac2-2c42b4898ef5">
                    <installationCosts xsi:type="esdl:SingleValue" id="7155b680-3816-43f1-a28c-8693ef1fdc8a" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="d0eb24e7-a40f-477e-9c2d-5faea982f5d4"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:GenericProducer" prodType="FOSSIL" technicalLifetime="15.0" power="3500000.0" name="ProductionCluster2" id="ProductionCluster2">
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="24f4c085-e2eb-4b6f-88df-02f59eec6abc" connectedTo="c7b82d94-cb65-4145-bad9-a2aebcb687cc" name="Out"/>
                <port xsi:type="esdl:InPort" connectedTo="69086536-c26b-4153-8a4b-1e434d1e5faf" carrier="HeatReturn" id="418669d2-6823-482a-a378-cb1c96afaa02" name="In"/>
                <geometry xsi:type="esdl:Point" lat="51.98335367797274" lon="4.380471110343934"/>
                <costInformation xsi:type="esdl:CostInformation" id="ec61479f-e79b-48e9-93e7-ad359c8a87eb">
                    <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="9bce1dac-3d6b-4dd3-b215-ddf9ea71c745" value="10000.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" description="Cost in EUR/yr" id="7d95a6d3-fd61-4206-975e-7a405b1d49e9" perTimeUnit="YEAR"/>
                    </fixedMaintenanceCosts>
                    <installationCosts xsi:type="esdl:SingleValue" id="1c0603cf-e2d7-4ad6-afe0-1e7afd317eba" value="100000.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="23a8faab-2829-4627-8ecf-071e87dc1431" physicalQuantity="COST" unit="EURO" description="Cost in EUR"/>
                    </installationCosts>
                    <variableOperationalCosts xsi:type="esdl:SingleValue" id="64ecf791-5d4c-440b-8a37-eeb2cc26c76a" value="5.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="JOULE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/GJ" id="a9151bbf-8b44-43ad-8c8b-270cf369634e" perMultiplier="GIGA"/>
                    </variableOperationalCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Joint" name="ReturnJoint1" id="ReturnJoint1">
                <port xsi:type="esdl:InPort" connectedTo="6c40211f-6266-40a0-9b1d-4f226abda0d3" carrier="HeatReturn" id="9eaa0b33-a03a-4f88-a57e-e40e6ee0e2af" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="399facac-007e-4218-97ce-b9a0668eb4d6" connectedTo="3fce9c49-a999-471f-b090-588aed143a02 3222f21d-e2e0-4363-871e-019a55bebd7f" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.99091986434303" lon="4.377992749214173"/>
            </asset>
            <asset xsi:type="esdl:Joint" name="ReturnJoint2" id="ReturnJoint2">
                <port xsi:type="esdl:InPort" connectedTo="6431ad64-8df1-4416-86d7-2ccc88ee0348 b8a5669a-5ff7-40ba-93e6-9276ec39d782 ac18e5ff-63a4-4cf5-b43a-a048f651bd08 f7d757c9-07af-43ba-9f88-a915ad61a9f3" carrier="HeatReturn" id="757fe809-0d26-4011-b01a-a4c7d27ac434" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="dda28c21-dffc-40e5-af62-697cca59ca26" connectedTo="314c9618-2d1f-4374-82df-a1fd478f9560" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.991044979002446" lon="4.3845145404338846"/>
            </asset>
            <asset xsi:type="esdl:Joint" name="ReturnJoint3" id="ReturnJoint3">
                <port xsi:type="esdl:InPort" connectedTo="f66253cc-aa4e-44d2-89a1-2711bb34c7cc" carrier="HeatReturn" id="3c2b10b2-ad29-4387-a788-030017e8bcbe" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="6b3b5bf7-7b5a-4b98-bb30-7a5299bc51cd" connectedTo="f686ec46-fc9c-424d-b662-30f5cb766f2b 84e76433-b5d4-4f4d-91e7-8f3234cf75e6" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.98787901345289" lon="4.381958395242692"/>
            </asset>
            <asset xsi:type="esdl:Joint" name="ReturnJoint5" id="ReturnJoint5">
                <port xsi:type="esdl:InPort" connectedTo="8605ce4b-068f-4541-9582-7da47b330679 948ba2aa-64ff-4272-8424-235bd596201f 32dce824-6ab5-4040-933c-8a2b32bfb369" carrier="HeatReturn" id="9d334c5d-2c45-4833-afbe-a580d9c43d6e" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="3900fa68-6765-4987-b213-9fbe3aec4f87" connectedTo="86ab8d79-9781-4b33-b569-c551fc5addf6" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.98447706928387" lon="4.3815332651138315"/>
            </asset>
            <asset xsi:type="esdl:Pump" pumpEfficiency="0.8" pumpCapacity="100.0" name="InternalPump_ProductionCluster1" id="InternalPump_ProductionCluster1">
                <port xsi:type="esdl:InPort" connectedTo="b2b92660-f268-47c6-b4b2-4231e7a51459" carrier="HeatSupply" id="92fba996-ca7b-4aa6-a995-b39f6951a83e" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="ff998fa2-1263-46b4-af45-859735b1042d" connectedTo="2fb1015e-7d0f-4c3d-a409-440f748dadbe" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.992927491687084" lon="4.3847036361694345"/>
                <costInformation xsi:type="esdl:CostInformation" id="2d83b04c-9f4b-4257-9d4b-9cc93ed9dfd4">
                    <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="c1e943f6-c95f-4109-9c13-88c83fe3a46f" value="3.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="7610eb23-31a7-49c3-8be2-4c4a66c99ce1" physicalQuantity="COST" unit="PERCENT" description="Cost in %"/>
                    </fixedMaintenanceCosts>
                    <installationCosts xsi:type="esdl:SingleValue" id="70911493-34ad-4c05-9010-a760f3d03631" value="500.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="5781e5d8-abf2-4cc0-b9a7-b641e290c02a" physicalQuantity="COST" unit="EURO" description="Cost in EUR"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pump" pumpEfficiency="0.8" pumpCapacity="100.0" name="InternalPump_ProductionCluster2" id="InternalPump_ProductionCluster2">
                <port xsi:type="esdl:InPort" connectedTo="24f4c085-e2eb-4b6f-88df-02f59eec6abc" carrier="HeatSupply" id="c7b82d94-cb65-4145-bad9-a2aebcb687cc" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="4bba5d2a-2454-421a-99df-4c7acf06f9c2" connectedTo="061b192e-5058-4bad-a203-465a87f2ba80" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.98359819292878" lon="4.380288720130921"/>
                <costInformation xsi:type="esdl:CostInformation" id="eea91d58-82a2-48be-8e6c-c2b7f6d18314">
                    <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="eaba8510-2b38-4bee-a1ed-9aa467444455" value="3.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9af073a-c2e5-4914-a846-917a52946aa9" physicalQuantity="COST" unit="PERCENT" description="Cost in %"/>
                    </fixedMaintenanceCosts>
                    <installationCosts xsi:type="esdl:SingleValue" id="8217478b-6164-429d-92b3-ebbfa901c6d3" value="500.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="bd36585c-b6a6-4e4a-bdfa-57885b48f879" physicalQuantity="COST" unit="EURO" description="Cost in EUR"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pump" pumpEfficiency="0.8" pumpCapacity="18.0" name="InternalPump_BufferCluster1" id="InternalPump_BufferCluster1">
                <port xsi:type="esdl:InPort" connectedTo="c494d97f-572c-4337-9ef5-615b9d94e7a1" carrier="HeatSupply" id="8a9ab2fb-5a65-4805-9ca1-58cbb62b123a" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="3b3c823f-cd14-49ea-a6ea-f833da8a1b7d" connectedTo="4cf8786d-049d-4e5b-8964-3817b97858ca" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.98944547262563" lon="4.387659430503846"/>
                <costInformation xsi:type="esdl:CostInformation" id="8c72a59d-d215-4b7e-a2f7-fffd9d004fff">
                    <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="862480df-4a09-4e57-b724-f0190f2996fd" value="3.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d0a587aa-b163-41ae-a69b-d6a5b7630099" physicalQuantity="COST" unit="PERCENT" description="Cost in %"/>
                    </fixedMaintenanceCosts>
                    <installationCosts xsi:type="esdl:SingleValue" id="7595577d-a8f2-49ef-82de-1d48640de38c" value="500.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="f1e82164-121c-498e-ac16-1b876aa47c63" physicalQuantity="COST" unit="EURO" description="Cost in EUR"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pump" pumpEfficiency="0.8" pumpCapacity="100.0" name="IntenalPump_DemandCluster1" id="IntenalPump_DemandCluster1">
                <port xsi:type="esdl:InPort" connectedTo="b7fb7975-df60-448e-a6da-8f54b74da1cd" carrier="HeatSupply" id="1d7443d0-d100-4806-b2f9-8f69bdec4b7c" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="e85db14d-caeb-4c08-bc72-0632435d227f" connectedTo="7ae22988-9598-47b6-b94b-60712a057587" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.99168551206973" lon="4.376168847084046"/>
                <costInformation xsi:type="esdl:CostInformation" id="e73f8ebc-cc39-4bce-8087-acf538d7afda">
                    <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="22be3707-d216-48a7-bd0f-b3299330322b" value="3.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="eaff65e1-debe-49f7-a389-cdd8f49abf46" physicalQuantity="COST" unit="PERCENT" description="Cost in %"/>
                    </fixedMaintenanceCosts>
                    <installationCosts xsi:type="esdl:SingleValue" id="aad758d2-7770-43a4-8ab7-b4592c18754e" value="500.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a03b93bc-c6e7-4f71-96f1-e8d7f3a8d482" physicalQuantity="COST" unit="EURO" description="Cost in EUR"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pump" pumpEfficiency="0.8" pumpCapacity="100.0" name="InternalPump_DemandCluster2" id="InternalPump_DemandCluster2">
                <port xsi:type="esdl:InPort" connectedTo="3856da25-ad4f-43bc-ac3b-a5ebaa75acfd" carrier="HeatSupply" id="a7c19697-a264-4801-ab7d-97fbae02936b" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="284ea711-01c2-4cc1-a365-ebcd67eb1326" connectedTo="07922681-c0f5-4a04-9e36-68afdb6efddb" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.98815573362102" lon="4.38007414340973"/>
                <costInformation xsi:type="esdl:CostInformation" id="32f48c38-9ce1-4f5e-be96-84e78915a4db">
                    <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="5142916f-c434-4afa-84b0-e9c8c996674f" value="3.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="8e2ffcfc-d3e3-4ef8-9417-f8fdeb0512d3" physicalQuantity="COST" unit="PERCENT" description="Cost in %"/>
                    </fixedMaintenanceCosts>
                    <installationCosts xsi:type="esdl:SingleValue" id="ac290b9a-7fae-48b8-945b-f02c5d238914" value="500.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="068be4cb-6763-454b-ae26-0fb87ef11634" physicalQuantity="COST" unit="EURO" description="Cost in EUR"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pump" pumpEfficiency="0.8" pumpCapacity="100.0" name="InternalPump_DemandCluster3" id="InternalPump_DemandCluster3">
                <port xsi:type="esdl:InPort" connectedTo="cc79a30f-ddb7-46d7-8e13-428a3757d7a0" carrier="HeatSupply" id="8f32dffc-c514-44a4-9070-ca270da434ad" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="6ac8f22a-202a-4ac1-94de-74f1e7fb3dd1" connectedTo="76235222-f7e2-4b75-b3ec-866adef4e821" name="Out"/>
                <geometry xsi:type="esdl:Point" lat="51.98576559186974" lon="4.388791322708131"/>
                <costInformation xsi:type="esdl:CostInformation" id="e2bc90bc-b6b1-4659-b524-617d53849d20">
                    <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="f56bfe60-5031-4ba6-a432-1f2f8ad16305" value="3.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="53b7ae73-5494-4c88-8d5f-42b453b79b8e" physicalQuantity="COST" unit="PERCENT" description="Cost in %"/>
                    </fixedMaintenanceCosts>
                    <installationCosts xsi:type="esdl:SingleValue" id="3d37402c-88a3-4cca-bd3c-1ac1ec1d1121" value="500.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="4e55f4ec-1fb4-4dfc-8d68-d10f95868a95" physicalQuantity="COST" unit="EURO" description="Cost in EUR"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="100.0" name="Pipe10" id="Pipe10">
                <port xsi:type="esdl:InPort" connectedTo="f93cbaa0-76d2-4be8-9ae4-c4e7e9d6dac9" carrier="HeatReturn" id="54a7c49c-806b-4569-95c2-38fcdfe12eae" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="6c40211f-6266-40a0-9b1d-4f226abda0d3" connectedTo="9eaa0b33-a03a-4f88-a57e-e40e6ee0e2af" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.99132536503811" lon="4.3765121698379525"/>
                    <point xsi:type="esdl:Point" lat="51.99101486177965" lon="4.377874732017518"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="3d322183-3bab-49d0-a4a4-29479648cb4f" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="b8e8ed16-256b-462a-a5d5-afba5661fd72">
                    <installationCosts xsi:type="esdl:SingleValue" id="b26a9115-466a-4d82-94e0-6fef7cad77d9" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="b57de1e6-72f3-483c-a25c-7b4fbdbd1532"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="100.0" name="Pipe9" id="Pipe9">
                <port xsi:type="esdl:InPort" connectedTo="c3c38e70-c672-4ed0-8b43-5388eb144cdd" carrier="HeatSupply" id="1ab7760c-3994-48c4-bc60-5d0022b45ea8" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="b7fb7975-df60-448e-a6da-8f54b74da1cd" connectedTo="1d7443d0-d100-4806-b2f9-8f69bdec4b7c" name="Out"/>
                <geometry xsi:type="esdl:Line" CRS="WGS84">
                    <point xsi:type="esdl:Point" lat="51.99103378905316" lon="4.3778854608535775"/>
                    <point xsi:type="esdl:Point" lat="51.99134273771812" lon="4.376528263092042"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="bb0110e4-7e53-4338-8210-5b02d66e498e" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="d2b377b4-7242-4f0e-bdbd-723c62ce7e33">
                    <installationCosts xsi:type="esdl:SingleValue" id="e056f11a-8ba9-4f7d-834b-1db1f9c9eca4" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="4a72151b-a859-42c9-9559-b601368d5836"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="100.0" name="Pipe11" id="Pipe11">
                <port xsi:type="esdl:InPort" connectedTo="19a4dc27-f87a-451a-8825-1ecb886d0a12" carrier="HeatSupply" id="9b08fde6-dbb0-4a48-82c8-7f21f7eb2006" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="3856da25-ad4f-43bc-ac3b-a5ebaa75acfd" connectedTo="a7c19697-a264-4801-ab7d-97fbae02936b" name="Out"/>
                <geometry xsi:type="esdl:Line" CRS="WGS84">
                    <point xsi:type="esdl:Point" lat="51.987986475734644" lon="4.381790757179261"/>
                    <point xsi:type="esdl:Point" lat="51.98803273871151" lon="4.380336999893189"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="62887ad5-d8be-4462-adcf-0031a0228cd8" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="380a3406-33da-40d4-a854-d610487ec510">
                    <installationCosts xsi:type="esdl:SingleValue" id="885182bd-a03b-4e40-907a-78380ae9d700" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="2b05dfde-3947-4b0b-97d8-1af706e56ffe"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="100.0" name="Pipe12" id="Pipe12">
                <port xsi:type="esdl:InPort" connectedTo="7de3c006-ed3c-4ef8-ae45-726395b80b9e" carrier="HeatReturn" id="79798b42-c866-4bdc-9c62-1d9fe8ba5e43" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="f66253cc-aa4e-44d2-89a1-2711bb34c7cc" connectedTo="3c2b10b2-ad29-4387-a788-030017e8bcbe" name="Out"/>
                <geometry xsi:type="esdl:Line" CRS="WGS84">
                    <point xsi:type="esdl:Point" lat="51.98801273871151" lon="4.380316999893189"/>
                    <point xsi:type="esdl:Point" lat="51.987966475734645" lon="4.381770757179261"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="ac591b25-3928-441a-aa1e-3cf9b645de55" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="4525f152-eca9-43ba-9154-87aac4e30cee">
                    <installationCosts xsi:type="esdl:SingleValue" id="9e696803-890e-4757-860d-4fb4c5535d8f" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="806a8bce-989b-4c0d-b599-2c0ee5c55d2f"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="100.0" name="Pipe13" id="Pipe13">
                <port xsi:type="esdl:InPort" connectedTo="34158152-401c-4afd-885c-2920ddf92527" carrier="HeatSupply" id="2098b217-80b3-4b58-9398-f1311a07bf4b" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="cc79a30f-ddb7-46d7-8e13-428a3757d7a0" connectedTo="8f32dffc-c514-44a4-9070-ca270da434ad" name="Out"/>
                <geometry xsi:type="esdl:Line" CRS="WGS84">
                    <point xsi:type="esdl:Point" lat="51.98580124609937" lon="4.3869996070861825"/>
                    <point xsi:type="esdl:Point" lat="51.98567566879406" lon="4.3884479999542245"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="5f8723b2-fed7-44bf-8b62-b31005301dc2" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="42922dec-01d9-41d9-96f7-bc69742cf2ac">
                    <installationCosts xsi:type="esdl:SingleValue" id="20e376ea-26a6-4f8d-ba53-765f206ed091" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="c1553a91-423b-4fd3-a95f-522ade6bcf29"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="100.0" name="Pipe14" id="Pipe14">
                <port xsi:type="esdl:InPort" connectedTo="a6ab318d-80b2-4152-be72-bd8ea23ddedc" carrier="HeatReturn" id="15ecad94-e93e-43f7-bdd9-06df3283e0fc" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="851f1ce6-d560-4d70-b634-bfad084d40e0" connectedTo="12f52dd0-4416-4899-8cec-b66e8661ed07 71a05dd4-7586-49f2-8b88-4ff9d55d0eba" name="Out"/>
                <geometry xsi:type="esdl:Line" CRS="WGS84">
                    <point xsi:type="esdl:Point" lat="51.98565566879406" lon="4.388427999954224"/>
                    <point xsi:type="esdl:Point" lat="51.98578124609937" lon="4.386979607086182"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="ed637a0c-1e67-434e-9b15-2e0ece12de32" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="0475a36d-15f4-4bbb-86f8-b3f844437dc7">
                    <installationCosts xsi:type="esdl:SingleValue" id="b57a35a7-7289-4912-b6f5-b124365d79bd" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="5dd83818-29eb-46b5-a529-dab699ddaf53"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="100.0" name="Pipe15" id="Pipe15">
                <port xsi:type="esdl:InPort" connectedTo="4bba5d2a-2454-421a-99df-4c7acf06f9c2" carrier="HeatSupply" id="061b192e-5058-4bad-a203-465a87f2ba80" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatSupply" id="8452c654-6f4c-460b-8342-52bd6df055ec" connectedTo="edb95a74-9f5b-47ba-a561-c1d5c8db6888" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.98371305532572" lon="4.380475133657456"/>
                    <point xsi:type="esdl:Point" lat="51.984437426342396" lon="4.381328076124192"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="67075b66-7869-4a2d-9994-69e8d4d17088" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="da1fc993-e8ff-424f-8f19-49835b01f165">
                    <installationCosts xsi:type="esdl:SingleValue" id="b8b14e29-965c-46e6-912c-10633b7f354a" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="fc86d7e6-3b72-4fc1-aa74-8caf6b1b9256"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Pipe" diameter="DN100" length="100.0" name="Pipe16" id="Pipe16">
                <port xsi:type="esdl:InPort" connectedTo="3900fa68-6765-4987-b213-9fbe3aec4f87" carrier="HeatReturn" id="86ab8d79-9781-4b33-b569-c551fc5addf6" name="In"/>
                <port xsi:type="esdl:OutPort" carrier="HeatReturn" id="69086536-c26b-4153-8a4b-1e434d1e5faf" connectedTo="418669d2-6823-482a-a378-cb1c96afaa02" name="Out"/>
                <geometry xsi:type="esdl:Line">
                    <point xsi:type="esdl:Point" lat="51.98442751110717" lon="4.381364285945893"/>
                    <point xsi:type="esdl:Point" lat="51.98369240591502" lon="4.380492568016053"/>
                </geometry>
                <material xsi:type="esdl:MatterReference" name="DN100" id="4ccf50f4-1b22-433b-b48f-3b24e7aea18c" reference="db89f983-b06f-4a9a-8c6c-4f0e06192b64"/>
                <costInformation xsi:type="esdl:CostInformation" id="326b6dfa-5852-4598-873c-3eea2d20aba8">
                    <installationCosts xsi:type="esdl:SingleValue" id="be6b6de3-a359-457a-a010-b73c869b0ae0" value="950.0">
                        <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" physicalQuantity="COST" description="Cost in EUR/m" id="1ab5aa30-9857-4d06-8315-282de27c6ef2"/>
                    </installationCosts>
                </costInformation>
            </asset>
            <asset xsi:type="esdl:Joint" name="Joint_a7a2" id="a7a2f032-09a7-427b-a38b-8f4903f51adb">
                <port xsi:type="esdl:InPort" id="75e7c085-61b1-46eb-b977-6bc8b5063312" name="In"/>
                <port xsi:type="esdl:OutPort" id="8addf7f1-9c31-4884-b19e-316576aabc69" connectedTo="7abadf5a-0e24-4b70-8eb2-91d9a58123e1" name="Out"/>
                <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.98603575561607" lon="4.386731386184693"/>
            </asset>
        </area>
    </instance>
</esdl:EnergySystem>