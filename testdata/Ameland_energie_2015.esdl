<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:esdl="http://www.tno.nl/esdl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" description="" name="Ameland 2015" id="Ameland2015">
  <services xsi:type="esdl:Services">
    <service xsi:type="esdl:DrivenByDemand" id="a3bd967d-f1f1-4369-946a-c7b8958dc4f6" energyAsset="c62d3fb8-9afb-40b9-b213-f8f5b2fb6581" name="DrivenByDemand for Bu_GasHeater_c62d" outPort="a5130f70-cb50-4cd2-812e-1a884c74999a"/>
    <service xsi:type="esdl:DrivenByDemand" id="e8a9ee5a-cdc6-490c-9cfe-be223fe3c34c" energyAsset="aab98ef6-7b64-404f-a8ee-dff1670a20b1" name="DrivenByDemand for Ne_GasHeater_aab9" outPort="c85ed617-0ffe-408f-9b1c-e304cf5e1b37"/>
    <service xsi:type="esdl:DrivenByDemand" id="d2320906-475d-4cf1-b01b-d0a1ed5ca0ea" energyAsset="c8f78aae-361f-418f-a82e-210fd798f7bb" name="DrivenByDemand for VHNe_GasHeater_c8f7" outPort="04963699-53e1-4673-b8ba-d61813ce8b96"/>
    <service xsi:type="esdl:DrivenByDemand" id="8808a8d3-68d2-4c7f-8d2d-41ce24e68e54" energyAsset="8f02b7e6-6b19-4652-819e-69e0ba909fd4" name="DrivenByDemand for VHBa_GasHeater_8f02" outPort="9262f2cf-2470-417a-8613-a291c32efea8"/>
    <service xsi:type="esdl:DrivenByDemand" id="7d4b0811-a6f4-4572-80c9-7a412c211c52" energyAsset="2d28df87-5b82-4651-afe4-e7d37fe22cf2" name="DrivenByDemand for Ba_GasHeater_2d28" outPort="e442cf09-12a3-43d7-98dc-e5206d17e79d"/>
    <service xsi:type="esdl:DrivenByDemand" id="73b54499-cb74-4b4b-b2b4-49dea44c2070" energyAsset="cd2fa0d3-793c-4a12-97a5-6dd7313ae2ae" name="DrivenByDemand for VHHo_GasHeater_cd2f" outPort="32d265ec-4992-4bdc-ac3c-87688b9722ca"/>
    <service xsi:type="esdl:DrivenByDemand" id="c5015b4e-504d-4665-b4ca-4ebcfacfff7a" energyAsset="fdd77b68-cb6d-4f3e-9cae-d169d0b46feb" name="DrivenByDemand for Ho_GasHeater_fdd7" outPort="d6eb6279-959d-458d-ab4c-c1264f308ca8"/>
  </services>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="54ddf510-935f-4ca7-ace5-e6dbda12d826">
    <carriers xsi:type="esdl:Carriers" id="6cf4541d-b1fe-4bf1-b160-0fb0977e5d43">
      <carrier xsi:type="esdl:EnergyCarrier" energyContent="35.17" energyCarrierType="FOSSIL" id="NaturalGas" emission="1.79139" name="NaturalGas" stateOfMatter="GASEOUS">
        <emissionUnit xsi:type="esdl:QuantityAndUnitType" multiplier="KILO" physicalQuantity="EMISSION" perUnit="CUBIC_METRE" unit="GRAM"/>
        <energyContentUnit xsi:type="esdl:QuantityAndUnitType" multiplier="MEGA" physicalQuantity="ENERGY" perUnit="CUBIC_METRE" unit="JOULE"/>
      </carrier>
      <carrier xsi:type="esdl:EnergyCarrier" energyContent="3.6" energyCarrierType="FOSSIL" id="Electricity" emission="0.649" name="Electricity">
        <emissionUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" perMultiplier="KILO" unit="GRAM" multiplier="KILO" physicalQuantity="EMISSION"/>
        <energyContentUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" perMultiplier="KILO" unit="JOULE" multiplier="MEGA" physicalQuantity="ENERGY"/>
      </carrier>
      <carrier xsi:type="esdl:HeatCommodity" name="Heat" id="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8"/>
      <carrier xsi:type="esdl:EnergyCarrier" energyContent="43.2" energyCarrierType="FOSSIL" id="e6badcc1-f266-494c-a3f2-cb1ed348db6c" emission="3.132" name="Diesel" stateOfMatter="LIQUID">
        <emissionUnit xsi:type="esdl:QuantityAndUnitType" perUnit="GRAM" perMultiplier="KILO" unit="GRAM" multiplier="KILO" physicalQuantity="EMISSION"/>
        <energyContentUnit xsi:type="esdl:QuantityAndUnitType" perUnit="GRAM" perMultiplier="KILO" unit="JOULE" multiplier="MEGA" physicalQuantity="ENERGY"/>
      </carrier>
      <carrier xsi:type="esdl:EnergyCarrier" energyContent="43.0" energyCarrierType="FOSSIL" id="b36f5cfb-6e95-4673-bb48-4d6a3d0db5d5" emission="3.139" name="Benzine" stateOfMatter="LIQUID">
        <emissionUnit xsi:type="esdl:QuantityAndUnitType" perUnit="GRAM" perMultiplier="KILO" unit="GRAM" multiplier="KILO" physicalQuantity="EMISSION"/>
        <energyContentUnit xsi:type="esdl:QuantityAndUnitType" perUnit="GRAM" perMultiplier="KILO" unit="JOULE" multiplier="MEGA" physicalQuantity="ENERGY"/>
      </carrier>
    </carriers>
    <sectors xsi:type="esdl:Sectors" id="3a4f2db7-2e89-4b6d-803e-45a94d94efc5">
      <sector xsi:type="esdl:Sector" name="Huishoudens" description="" code="" id="1163d341-aa95-4b44-826a-c07d8e4e98e2"/>
      <sector xsi:type="esdl:Sector" name="Bedrijven" description="" code="" id="78f77e27-4cc9-4bdc-b16c-a1544dace574"/>
      <sector xsi:type="esdl:Sector" name="Mobiliteit" description="" code="" id="e226e93d-dbac-492a-923a-874f5b4cd530"/>
    </sectors>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" name="Ameland situatie 2015" id="f51bc852-b610-46a0-a588-22dc0acf4ede">
    <area xsi:type="esdl:Area" name="Gemeente Ameland" id="GM0060" scope="MUNICIPALITY">
      <area xsi:type="esdl:Area" name="Nes" id="BU00600000" scope="NEIGHBOURHOOD">
        <asset xsi:type="esdl:ElectricityDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="5b95fd99-0a98-4b11-a06c-7699d395f9b6">
          <geometry xsi:type="esdl:Point" lat="53.4462" lon="5.768466"/>
          <port xsi:type="esdl:InPort" id="fc8270e1-9757-4cd7-82fd-c5801a63102a" name="In" connectedTo="9820f773-7569-4b52-908c-60c57951bbe9" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="f3222531-c13f-4867-b8ac-6b8ae6d1a871" database="energy_profiles" multiplier="5.29" profileType="ENERGY_IN_TJ" field="E1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="966f131f-d9bb-43a7-8ebc-b9814853fcb5">
          <geometry xsi:type="esdl:Point" lat="53.445689" lon="5.772285"/>
          <port xsi:type="esdl:InPort" id="cff29b01-275c-4b95-9919-5aaf63e2af57" name="In" connectedTo="9820f773-7569-4b52-908c-60c57951bbe9" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="d3fa7e6f-00da-4eb5-86a9-8c63af7c1d0c" database="energy_profiles" multiplier="3.88" profileType="ENERGY_IN_TJ" field="E3C" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="317a5e49-f749-45c3-bd17-90088b790d5e">
          <geometry xsi:type="esdl:Point" lat="53.446149" lon="5.77589"/>
          <port xsi:type="esdl:InPort" id="73868071-6b57-43ed-a4d8-1e43b8090c20" name="In" connectedTo="9820f773-7569-4b52-908c-60c57951bbe9" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="579c90dc-a8ab-4c51-a891-8708d6780c98" database="energy_profiles" multiplier="11.43" profileType="ENERGY_IN_TJ" field="E3A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:GasHeater" efficiency="0.9" name="Ne_GasHeater_aab9" id="aab98ef6-7b64-404f-a8ee-dff1670a20b1" power="10000000.0" controlStrategy="e8a9ee5a-cdc6-490c-9cfe-be223fe3c34c">
          <geometry xsi:type="esdl:Point" lat="53.443363" lon="5.769281"/>
          <port xsi:type="esdl:InPort" id="ac8bffb2-82b7-43cc-8ec1-d4e3984fb623" name="In" connectedTo="26aecda5-115c-4d69-bd8f-d3df0e98587e" carrier="NaturalGas"/>
          <port xsi:type="esdl:OutPort" id="c85ed617-0ffe-408f-9b1c-e304cf5e1b37" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8" name="Out" connectedTo="1bc422ff-11a0-493a-b138-ccab4eef0479 50340058-51d5-46aa-a019-603cecd61594 d9b08ab0-0ebd-4ad3-94d2-3876d0c8a330"/>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="8f4e6b6d-acdf-47be-aece-0ba549b617b3">
          <geometry xsi:type="esdl:Point" lat="53.445075" lon="5.768337"/>
          <port xsi:type="esdl:InPort" id="1bc422ff-11a0-493a-b138-ccab4eef0479" name="In" connectedTo="c85ed617-0ffe-408f-9b1c-e304cf5e1b37" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="3b9a400e-4509-4fa7-ad44-a950a288a1fc" database="energy_profiles" multiplier="25.77" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="6ac013b9-f2cd-4e93-a0dc-ec05b4819540">
          <geometry xsi:type="esdl:Point" lat="53.444462" lon="5.772457"/>
          <port xsi:type="esdl:InPort" id="50340058-51d5-46aa-a019-603cecd61594" name="In" connectedTo="c85ed617-0ffe-408f-9b1c-e304cf5e1b37" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="3cad0c09-21a0-4fac-b243-23d5259f5b3e" database="energy_profiles" multiplier="8.92" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="5861ab77-606c-4bec-8401-569fa5ae1f95">
          <geometry xsi:type="esdl:Point" lat="53.444794" lon="5.776062"/>
          <port xsi:type="esdl:InPort" id="d9b08ab0-0ebd-4ad3-94d2-3876d0c8a330" name="In" connectedTo="c85ed617-0ffe-408f-9b1c-e304cf5e1b37" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="393f9b2c-c977-462e-904c-5546653e12fe" database="energy_profiles" multiplier="20.02" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
      </area>
      <area xsi:type="esdl:Area" name="Buren" id="BU00600001" scope="NEIGHBOURHOOD">
        <asset xsi:type="esdl:ElectricityDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="6996858c-9d1f-40e6-b0c2-d7c414abe3b4">
          <geometry xsi:type="esdl:Point" lat="53.448909" lon="5.797734"/>
          <port xsi:type="esdl:InPort" id="69ae5d15-6c05-453e-9891-bced8d270c18" name="In" connectedTo="1f48843e-80a7-4f2d-ada9-0faeb91ca3cd" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="c7e94fca-0721-4cf5-bc7f-560397ed2eb2" database="energy_profiles" multiplier="6.4" profileType="ENERGY_IN_TJ" field="E1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="eddd49e3-e346-46a0-9bec-d6ba5de4c0a4">
          <geometry xsi:type="esdl:Point" lat="53.454123" lon="5.805888"/>
          <port xsi:type="esdl:InPort" id="105f415a-f32e-4884-b107-404616e274b2" name="In" connectedTo="1f48843e-80a7-4f2d-ada9-0faeb91ca3cd" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="83d0edac-cadc-46af-93d4-dc9d3d77162f" database="energy_profiles" multiplier="7.9" profileType="ENERGY_IN_TJ" field="E3C" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="96e8d599-4c2c-4f8a-bff9-e564946969ea">
          <geometry xsi:type="esdl:Point" lat="53.448628" lon="5.802455"/>
          <port xsi:type="esdl:InPort" id="caba809c-d80b-4ef8-9fe1-bd9d35c654e1" name="In" connectedTo="1f48843e-80a7-4f2d-ada9-0faeb91ca3cd" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="945dff75-52a0-4232-b2da-a6f904e09c74" database="energy_profiles" multiplier="2.49" profileType="ENERGY_IN_TJ" field="E3A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:GasHeater" efficiency="0.9" name="Bu_GasHeater_c62d" id="c62d3fb8-9afb-40b9-b213-f8f5b2fb6581" power="10000000.0" controlStrategy="a3bd967d-f1f1-4369-946a-c7b8958dc4f6">
          <geometry xsi:type="esdl:Point" lat="53.446455" lon="5.797648"/>
          <port xsi:type="esdl:InPort" id="08cc2650-3783-46c8-a79b-bf9ad2468ab6" name="In" connectedTo="26aecda5-115c-4d69-bd8f-d3df0e98587e" carrier="NaturalGas"/>
          <port xsi:type="esdl:OutPort" id="a5130f70-cb50-4cd2-812e-1a884c74999a" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8" name="Out" connectedTo="8935e73a-4b5e-4e8c-82e4-391473e5f27d cbf69471-690b-4275-9c66-b04dce037fc4 6135e488-5775-4cfb-a818-403b2695c1ba"/>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="39403875-7f83-497c-bf1b-54db683ed57e">
          <geometry xsi:type="esdl:Point" lat="53.448423" lon="5.795889"/>
          <port xsi:type="esdl:InPort" id="8935e73a-4b5e-4e8c-82e4-391473e5f27d" name="In" connectedTo="a5130f70-cb50-4cd2-812e-1a884c74999a" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="5b8acb9c-0512-4525-8061-0444c478de45" database="energy_profiles" multiplier="27.62" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="04c5c069-43c3-460f-a5b8-7a27f6f45002">
          <geometry xsi:type="esdl:Point" lat="53.447171" lon="5.802884"/>
          <port xsi:type="esdl:InPort" id="cbf69471-690b-4275-9c66-b04dce037fc4" name="In" connectedTo="a5130f70-cb50-4cd2-812e-1a884c74999a" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="6c9c0626-91ba-4fbb-9c4e-b406072e3002" database="energy_profiles" multiplier="34.01" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" id="bff7ac6a-6eb2-46b3-a141-ef9b3197c1dc">
          <geometry xsi:type="esdl:Point" lat="53.452385" lon="5.805931"/>
          <port xsi:type="esdl:InPort" id="6135e488-5775-4cfb-a818-403b2695c1ba" name="In" connectedTo="a5130f70-cb50-4cd2-812e-1a884c74999a" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="2c33c54b-70b9-47b1-95ca-109657e9d803" database="energy_profiles" multiplier="7.57" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
      </area>
      <area xsi:type="esdl:Area" name="Ballum" id="BU00600002" scope="NEIGHBOURHOOD">
        <asset xsi:type="esdl:ElectricityDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="14978bee-3e95-4c06-aee0-f53addb0801c">
          <geometry xsi:type="esdl:Point" lat="53.44587356431852" lon="5.68892776966095"/>
          <port xsi:type="esdl:InPort" id="4fc64cb8-4894-4b02-84bf-7619f7727de5" name="In" connectedTo="9db10501-bf79-42ba-893f-ea91d831b190" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="f73bc034-0a3a-44f3-8d15-a27e85c2e1f0" database="energy_profiles" multiplier="1.37" profileType="ENERGY_IN_TJ" field="E1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="3d526fc5-2dc8-41ac-987c-4a4211f74aeb">
          <geometry xsi:type="esdl:Point" lat="53.443152" lon="5.68698"/>
          <port xsi:type="esdl:InPort" id="9badfed2-4c6d-46fe-9548-40e6af0b3434" name="In" connectedTo="9db10501-bf79-42ba-893f-ea91d831b190" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="6dc50e11-4571-4542-b26b-5ee08181d143" database="energy_profiles" profileType="ENERGY_IN_TJ" field="E3C" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="76a054b2-13a0-49f4-872a-267aad450330">
          <geometry xsi:type="esdl:Point" lat="53.44461230202123" lon="5.688251852989197"/>
          <port xsi:type="esdl:InPort" id="c9e33db6-8fe6-439a-9df8-2a6d3b2f8cff" name="In" connectedTo="9db10501-bf79-42ba-893f-ea91d831b190" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="d451808a-2119-4afe-809d-3494eeabb28b" database="energy_profiles" multiplier="1.94" profileType="ENERGY_IN_TJ" field="E3A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:GasHeater" efficiency="0.9" name="Ba_GasHeater_2d28" id="2d28df87-5b82-4651-afe4-e7d37fe22cf2" power="10000000.0" controlStrategy="7d4b0811-a6f4-4572-80c9-7a412c211c52">
          <geometry xsi:type="esdl:Point" lat="53.444615" lon="5.691798"/>
          <port xsi:type="esdl:InPort" id="8eb16b6d-c283-4882-bf9d-bd4ee3c429f3" name="In" connectedTo="26aecda5-115c-4d69-bd8f-d3df0e98587e" carrier="NaturalGas"/>
          <port xsi:type="esdl:OutPort" id="e442cf09-12a3-43d7-98dc-e5206d17e79d" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8" name="Out" connectedTo="38260bea-4657-45e8-a433-373d816a66ed 0d41e3af-2129-4814-abd6-55c0594d276d 0e5c2b00-9416-4027-9119-a5f52340e08f"/>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="907e8dc3-cc46-4069-bbcc-00042a682eca">
          <geometry xsi:type="esdl:Point" lat="53.445906" lon="5.690553"/>
          <port xsi:type="esdl:InPort" id="38260bea-4657-45e8-a433-373d816a66ed" name="In" connectedTo="e442cf09-12a3-43d7-98dc-e5206d17e79d" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="2898e055-a849-4e71-bde2-8bbccdab64c5" database="energy_profiles" multiplier="6.53" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="48788518-2a44-4908-8997-c32f0e9aaf0b">
          <geometry xsi:type="esdl:Point" lat="53.444155" lon="5.690231"/>
          <port xsi:type="esdl:InPort" id="0d41e3af-2129-4814-abd6-55c0594d276d" name="In" connectedTo="e442cf09-12a3-43d7-98dc-e5206d17e79d" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="e4cfefb4-077d-4e90-a5e3-0c31dc3cc975" database="energy_profiles" multiplier="2.44" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="c12d60ae-b084-4be0-b2e3-afc8ba9df301">
          <geometry xsi:type="esdl:Point" lat="53.442762" lon="5.688686"/>
          <port xsi:type="esdl:InPort" id="0e5c2b00-9416-4027-9119-a5f52340e08f" name="In" connectedTo="e442cf09-12a3-43d7-98dc-e5206d17e79d" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="ac5911a8-cf2d-4ec3-b6c9-7033ef4e5415" database="energy_profiles" multiplier="3.63" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
      </area>
      <area xsi:type="esdl:Area" name="Hollum" id="BU00600003" scope="NEIGHBOURHOOD">
        <asset xsi:type="esdl:ElectricityDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="80d425c9-f1da-473c-a05c-2c83db8fed1f">
          <geometry xsi:type="esdl:Point" lat="53.440091" lon="5.636244"/>
          <port xsi:type="esdl:InPort" id="d07e1646-3f7c-4e02-bdac-6364d951d133" name="In" connectedTo="b1c1778e-f337-4429-b9c7-e3bd308ad514" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="6fe17b74-0917-4e99-937f-525a05e2ce2d" database="energy_profiles" multiplier="6.14" profileType="ENERGY_IN_TJ" field="E1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="2352c377-5eab-434c-8737-ddd6536b0534">
          <geometry xsi:type="esdl:Point" lat="53.440423" lon="5.638926"/>
          <port xsi:type="esdl:InPort" id="bb487db5-6ced-4bbb-84db-4381f77d6672" name="In" connectedTo="b1c1778e-f337-4429-b9c7-e3bd308ad514" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="7e83e23a-7418-4656-8c18-e8894f223023" database="energy_profiles" multiplier="2.67" profileType="ENERGY_IN_TJ" field="E3C" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="1735b9d7-a7ca-4fb6-bf29-7bbafad4a78f">
          <geometry xsi:type="esdl:Point" lat="53.439484" lon="5.642467"/>
          <port xsi:type="esdl:InPort" id="86e0761b-43cd-4d78-9577-6339607f11f7" name="In" connectedTo="b1c1778e-f337-4429-b9c7-e3bd308ad514" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="ce557fe0-b206-4d3a-a98a-d4b42872c0fc" database="energy_profiles" multiplier="5.91" profileType="ENERGY_IN_TJ" field="E3A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="318bf6a5-b863-490c-b7d8-a1a78909cfd6">
          <geometry xsi:type="esdl:Point" lat="53.441752" lon="5.636158"/>
          <port xsi:type="esdl:InPort" id="2c6c0963-cc99-4c48-8d50-502110868ce2" name="In" connectedTo="d6eb6279-959d-458d-ab4c-c1264f308ca8" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="16971032-9e84-475a-839e-eb08e9249a58" database="energy_profiles" multiplier="25.64" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="c1ab4f45-44c5-4457-958d-f42ff61519e3">
          <geometry xsi:type="esdl:Point" lat="53.441931" lon="5.63899"/>
          <port xsi:type="esdl:InPort" id="4d7b229c-e5b3-4982-95c1-73b832109573" name="In" connectedTo="d6eb6279-959d-458d-ab4c-c1264f308ca8" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="a213d1be-d3d4-4ee9-9a07-84d7e7ae94fe" database="energy_profiles" multiplier="6.04" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="1b3db1cd-c077-4ea4-99bf-60078a22aa63">
          <geometry xsi:type="esdl:Point" lat="53.441037" lon="5.642724"/>
          <port xsi:type="esdl:InPort" id="184f53d1-c566-4497-a305-c38297fdddab" name="In" connectedTo="d6eb6279-959d-458d-ab4c-c1264f308ca8" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="ffdabf2a-9fb1-46e1-830f-dc57101b4408" database="energy_profiles" multiplier="9.84" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:GasHeater" efficiency="0.9" name="Ho_GasHeater_fdd7" id="fdd77b68-cb6d-4f3e-9cae-d169d0b46feb" controlStrategy="c5015b4e-504d-4665-b4ca-4ebcfacfff7a">
          <geometry xsi:type="esdl:Point" lat="53.443593" lon="5.638218"/>
          <port xsi:type="esdl:InPort" id="ffa7f5e4-e06c-4765-bbb2-00b9ec860def" name="In" connectedTo="26aecda5-115c-4d69-bd8f-d3df0e98587e" carrier="NaturalGas"/>
          <port xsi:type="esdl:OutPort" id="d6eb6279-959d-458d-ab4c-c1264f308ca8" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8" name="Out" connectedTo="2c6c0963-cc99-4c48-8d50-502110868ce2 4d7b229c-e5b3-4982-95c1-73b832109573 184f53d1-c566-4497-a305-c38297fdddab"/>
        </asset>
      </area>
      <area xsi:type="esdl:Area" name="Verspreide huizen Ballum" id="BU00600007">
        <asset xsi:type="esdl:ElectricityDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="60eeccce-0aef-49a8-a57c-614d968b7e61">
          <geometry xsi:type="esdl:Point" lat="53.448794" lon="5.689566"/>
          <port xsi:type="esdl:InPort" id="195d3063-cc90-402c-9878-6f8b430164ec" name="In" connectedTo="a8e9ba14-67b4-4a6f-918c-991d842cb0bc" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="31dc7c97-539b-4c6e-9da9-3446fdf8df33" database="energy_profiles" multiplier="0.98" profileType="ENERGY_IN_TJ" field="E1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="68d1f2fd-2768-46fc-a1ad-9478db89782e">
          <geometry xsi:type="esdl:Point" lat="53.448206" lon="5.697076"/>
          <port xsi:type="esdl:InPort" id="271ec3fa-3de0-450e-a8cc-1ee4775025ed" name="In" connectedTo="a8e9ba14-67b4-4a6f-918c-991d842cb0bc" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="c9f30ea3-e242-41cf-9302-ce5c1f4ed371" database="energy_profiles" multiplier="3.79" profileType="ENERGY_IN_TJ" field="E3C" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="98994798-08a9-42a2-90c5-8b398301f5df">
          <geometry xsi:type="esdl:Point" lat="53.451733" lon="5.691411"/>
          <port xsi:type="esdl:InPort" id="6da276f2-ea9e-456b-8089-e17561e26546" name="In" connectedTo="a8e9ba14-67b4-4a6f-918c-991d842cb0bc" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="f36acb70-a148-4b46-8cb5-5d3001f0f5b7" database="energy_profiles" multiplier="2.01" profileType="ENERGY_IN_TJ" field="E3A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="52e6e999-c76a-4b23-ac47-b65809a4ee14">
          <geometry xsi:type="esdl:Point" lat="53.449727" lon="5.689781"/>
          <port xsi:type="esdl:InPort" id="862f9c17-c470-4a39-a054-2cb0c059c9bd" name="In" connectedTo="9262f2cf-2470-417a-8613-a291c32efea8" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="737b8db2-7107-47ee-ad7f-c068d8d49efd" database="energy_profiles" multiplier="9.83" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="3f121a3e-a464-4e1a-8901-2e5cd6dd01bf">
          <geometry xsi:type="esdl:Point" lat="53.45103" lon="5.691433"/>
          <port xsi:type="esdl:InPort" id="da6d9eba-06da-467a-8968-dd78a87aaefb" name="In" connectedTo="9262f2cf-2470-417a-8613-a291c32efea8" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="3ac019f7-873c-4876-8c7f-d2737343257a" database="energy_profiles" multiplier="7.05" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="4d73e4e2-a4f3-4c10-b5be-3f9e910a7d42">
          <geometry xsi:type="esdl:Point" lat="53.447797" lon="5.696068"/>
          <port xsi:type="esdl:InPort" id="1b4826b6-71a4-4e76-ae3b-abba0ac12083" name="In" connectedTo="9262f2cf-2470-417a-8613-a291c32efea8" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="b70997ad-2d07-4b63-8765-72175ceb2fca" database="energy_profiles" multiplier="3.33" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:GasHeater" efficiency="0.9" name="VHBa_GasHeater_8f02" id="8f02b7e6-6b19-4652-819e-69e0ba909fd4" power="10000000.0" controlStrategy="8808a8d3-68d2-4c7f-8d2d-41ce24e68e54">
          <geometry xsi:type="esdl:Point" lat="53.448947" lon="5.692205"/>
          <port xsi:type="esdl:InPort" id="ae4b29a8-8ce3-450b-b6f2-5e62e8168435" name="In" connectedTo="26aecda5-115c-4d69-bd8f-d3df0e98587e" carrier="NaturalGas"/>
          <port xsi:type="esdl:OutPort" id="9262f2cf-2470-417a-8613-a291c32efea8" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8" name="Out" connectedTo="862f9c17-c470-4a39-a054-2cb0c059c9bd da6d9eba-06da-467a-8968-dd78a87aaefb 1b4826b6-71a4-4e76-ae3b-abba0ac12083"/>
        </asset>
      </area>
      <area xsi:type="esdl:Area" name="Verspreide huizen Nes" id="BU00600008" scope="NEIGHBOURHOOD">
        <asset xsi:type="esdl:ElectricityDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="a1a0dcb6-13ac-41f1-a03c-d1128778d360">
          <geometry xsi:type="esdl:Point" lat="53.451618" lon="5.773015"/>
          <port xsi:type="esdl:InPort" id="3e0bf8d9-925d-40c5-a235-f3fcd330acd4" name="In" connectedTo="625ea875-e36e-4f13-bbab-d0a588094346" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="61bf2fe0-7772-4e91-839c-07dc7036da23" database="energy_profiles" multiplier="3.11" profileType="ENERGY_IN_TJ" field="E1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="b2d21c42-16cf-4fe4-9150-b2dcbda03a5d">
          <geometry xsi:type="esdl:Point" lat="53.456269" lon="5.774496"/>
          <port xsi:type="esdl:InPort" id="b7dcc2aa-77b9-428a-a578-1c7ebbfae1ca" name="In" connectedTo="625ea875-e36e-4f13-bbab-d0a588094346" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="9ae51c3c-0e71-4351-a5cc-46020e685c15" database="energy_profiles" multiplier="5.66" profileType="ENERGY_IN_TJ" field="E3C" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="48719286-f1a8-4ac2-82de-d085f7f72bc2">
          <geometry xsi:type="esdl:Point" lat="53.452679" lon="5.778015"/>
          <port xsi:type="esdl:InPort" id="25bc8c61-a1c0-4289-9cb8-2dac52488e05" name="In" connectedTo="625ea875-e36e-4f13-bbab-d0a588094346" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="147acd56-c7d8-441f-b57e-9d1cc2e50047" database="energy_profiles" multiplier="2.28" profileType="ENERGY_IN_TJ" field="E3A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="970b36b3-6d88-4719-a148-915300b9f4cb">
          <geometry xsi:type="esdl:Point" lat="53.45033603742132" lon="5.771491527557374"/>
          <port xsi:type="esdl:InPort" id="571a5491-b666-4a7d-8290-d7b5ba19c342" name="In" connectedTo="04963699-53e1-4673-b8ba-d61813ce8b96" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="1cd78e8c-b27f-4c67-8b55-a59089349fb6" database="energy_profiles" multiplier="4.36" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="86b2406d-d9e2-43fd-952f-c0754e18e0d5">
          <geometry xsi:type="esdl:Point" lat="53.451286" lon="5.779281"/>
          <port xsi:type="esdl:InPort" id="f070e150-6a6a-430e-bbb5-7e300b3fc93a" name="In" connectedTo="04963699-53e1-4673-b8ba-d61813ce8b96" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="205dde17-48c0-4eb1-a775-0e5bd261a0de" database="energy_profiles" multiplier="9.88" profileType="ENERGY_IN_TJ" field="E3D" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="a3ddc285-7e56-4ef5-bfca-bb12902b7f3e">
          <geometry xsi:type="esdl:Point" lat="53.45496369461303" lon="5.773133039474488"/>
          <port xsi:type="esdl:InPort" id="99e7c574-d619-4178-a83a-9999fa6a0f5d" name="In" connectedTo="04963699-53e1-4673-b8ba-d61813ce8b96" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="8bb2a2f5-88df-481c-9a7e-0923cfeb6f14" database="energy_profiles" multiplier="3.09" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:GasHeater" efficiency="0.9" name="VHNe_GasHeater_c8f7" id="c8f78aae-361f-418f-a82e-210fd798f7bb" power="10000000.0" controlStrategy="d2320906-475d-4cf1-b01b-d0a1ed5ca0ea">
          <geometry xsi:type="esdl:Point" lat="53.45011" lon="5.776577"/>
          <port xsi:type="esdl:InPort" id="603c40c5-3061-4a22-989f-ca1fb73db115" name="In" connectedTo="26aecda5-115c-4d69-bd8f-d3df0e98587e 04963699-53e1-4673-b8ba-d61813ce8b96" carrier="NaturalGas"/>
          <port xsi:type="esdl:OutPort" id="04963699-53e1-4673-b8ba-d61813ce8b96" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8" name="Out" connectedTo="571a5491-b666-4a7d-8290-d7b5ba19c342 f070e150-6a6a-430e-bbb5-7e300b3fc93a 99e7c574-d619-4178-a83a-9999fa6a0f5d 603c40c5-3061-4a22-989f-ca1fb73db115"/>
        </asset>
      </area>
      <area xsi:type="esdl:Area" name="Verspreide huizen Hollum" id="BU00600009" scope="NEIGHBOURHOOD">
        <asset xsi:type="esdl:ElectricityDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="5462057a-1535-4898-8515-4cf6cb764e5c">
          <geometry xsi:type="esdl:Point" lat="53.44882" lon="5.631137"/>
          <port xsi:type="esdl:InPort" id="7e01496d-2525-4ce8-a35d-53ed7adad633" name="In" connectedTo="64c1e59c-9007-4baa-8d53-b3425c21dbf4" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="23224b48-527b-4d7d-bbb4-3193d326abd9" database="energy_profiles" multiplier="1.75" profileType="ENERGY_IN_TJ" field="E1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="65bc8bd2-402d-4b4b-bb61-1af13eebdb30">
          <geometry xsi:type="esdl:Point" lat="53.452206" lon="5.637639"/>
          <port xsi:type="esdl:InPort" id="9633508c-be33-401a-b24c-f117b6ea5dec" name="In" connectedTo="64c1e59c-9007-4baa-8d53-b3425c21dbf4" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="eb561115-b456-4343-ad1e-24edcdfe3198" database="energy_profiles" multiplier="5.8" profileType="ENERGY_IN_TJ" field="E3C" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:ElectricityDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="921d319d-404a-4505-8f6f-09535500d368">
          <geometry xsi:type="esdl:Point" lat="53.447056" lon="5.640128"/>
          <port xsi:type="esdl:InPort" id="ece1e000-8f07-44c8-8ed0-f87b1e09e64d" name="In" connectedTo="64c1e59c-9007-4baa-8d53-b3425c21dbf4" carrier="Electricity">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_elektriciteit_2015-2018" id="07712906-97e7-43b8-a5c0-f6844621a437" database="energy_profiles" multiplier="1.5" profileType="ENERGY_IN_TJ" field="E3A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="1163d341-aa95-4b44-826a-c07d8e4e98e2" name="Huishoudens" id="ecef58ed-ea2e-4a75-97d4-175bb68b71f6">
          <geometry xsi:type="esdl:Point" lat="53.447938" lon="5.633411"/>
          <port xsi:type="esdl:InPort" id="daf88e43-f19f-46fb-8d25-56cc56cf3feb" name="In" connectedTo="32d265ec-4992-4bdc-ac3c-87688b9722ca" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="81296595-a377-4ea8-8885-a4cbf15e8f35" database="energy_profiles" multiplier="13.93" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Hotels en vakantieparken" id="a75a5123-09b3-4c07-833c-66e418612393">
          <geometry xsi:type="esdl:Point" lat="53.451081" lon="5.638862"/>
          <port xsi:type="esdl:InPort" id="f731d8fc-fbc0-4a4c-b55a-f752cd575f38" name="In" connectedTo="32d265ec-4992-4bdc-ac3c-87688b9722ca" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="5406ea59-c2d3-4940-b4ff-da62894edbe5" database="energy_profiles" multiplier="16.03" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:HeatingDemand" sector="78f77e27-4cc9-4bdc-b16c-a1544dace574" name="Overige bedrijven" id="78231753-5101-4a16-aad8-ea8b0f140dcc">
          <geometry xsi:type="esdl:Point" lat="53.44873" lon="5.64105"/>
          <port xsi:type="esdl:InPort" id="07bba258-c34b-4328-add8-1c1886c76ea3" name="In" connectedTo="32d265ec-4992-4bdc-ac3c-87688b9722ca" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8">
            <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="nedu_aardgas_2015-2018" id="7aa81884-60ab-4a1b-ae85-aa64cf2ffa0a" database="energy_profiles" multiplier="3.25" profileType="ENERGY_IN_TJ" field="G1A" port="8086" host="http://10.30.2.1"/>
          </port>
        </asset>
        <asset xsi:type="esdl:GasHeater" efficiency="0.9" name="VHHo_GasHeater_cd2f" id="cd2fa0d3-793c-4a12-97a5-6dd7313ae2ae" power="10000000.0" controlStrategy="73b54499-cb74-4b4b-b2b4-49dea44c2070">
          <geometry xsi:type="esdl:Point" lat="53.447018" lon="5.637531"/>
          <port xsi:type="esdl:InPort" id="9ea9fab6-b6b6-44c5-bd9d-c364defb19e2" name="In" connectedTo="26aecda5-115c-4d69-bd8f-d3df0e98587e" carrier="NaturalGas"/>
          <port xsi:type="esdl:OutPort" id="32d265ec-4992-4bdc-ac3c-87688b9722ca" carrier="e903f25f-78e8-4856-8c2e-db9d9fd7f1c8" name="Out" connectedTo="daf88e43-f19f-46fb-8d25-56cc56cf3feb f731d8fc-fbc0-4a4c-b55a-f752cd575f38 07bba258-c34b-4328-add8-1c1886c76ea3"/>
        </asset>
      </area>
      <asset xsi:type="esdl:Transformer" name="Transformer_a16a" id="a16a7aec-e25d-4789-a6f7-725b476b4990">
        <geometry xsi:type="esdl:Point" lat="53.438328" lon="5.639047"/>
        <port xsi:type="esdl:InPort" id="a369ca8b-cfc5-46ba-9f9b-7e2860f893d4" name="In" connectedTo="45ba8cc6-0fef-4810-a9b6-078b38955ed8" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="b1c1778e-f337-4429-b9c7-e3bd308ad514" carrier="Electricity" name="Out" connectedTo="d07e1646-3f7c-4e02-bdac-6364d951d133 bb487db5-6ced-4bbb-84db-4381f77d6672 86e0761b-43cd-4d78-9577-6339607f11f7"/>
      </asset>
      <asset xsi:type="esdl:Transformer" name="Transformer_1725" id="1725a828-8c3d-4e06-a598-9b3d07b72819">
        <geometry xsi:type="esdl:Point" lat="53.450136" lon="5.636823"/>
        <port xsi:type="esdl:InPort" id="b09cdd59-fd4f-4d15-a100-83e72ae37560" name="In" connectedTo="b451396a-2e73-4a9d-bebf-de9340294f46 64c1e59c-9007-4baa-8d53-b3425c21dbf4" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="64c1e59c-9007-4baa-8d53-b3425c21dbf4" carrier="Electricity" name="Out" connectedTo="7e01496d-2525-4ce8-a35d-53ed7adad633 9633508c-be33-401a-b24c-f117b6ea5dec ece1e000-8f07-44c8-8ed0-f87b1e09e64d b09cdd59-fd4f-4d15-a100-83e72ae37560"/>
      </asset>
      <asset xsi:type="esdl:Transformer" name="Transformer_4ff0" id="4ff06f49-5881-47eb-83eb-c829fc19cfcd">
        <geometry xsi:type="esdl:Point" lat="53.446219" lon="5.686329"/>
        <port xsi:type="esdl:InPort" id="0ffc4b9b-35e7-4abe-8838-9a3c1a744ce3" name="In" connectedTo="1671aa2f-7da7-4c59-a7c0-078b4da083a8" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="9db10501-bf79-42ba-893f-ea91d831b190" carrier="Electricity" name="Out" connectedTo="4fc64cb8-4894-4b02-84bf-7619f7727de5 9badfed2-4c6d-46fe-9548-40e6af0b3434 c9e33db6-8fe6-439a-9df8-2a6d3b2f8cff"/>
      </asset>
      <asset xsi:type="esdl:Transformer" name="Transformer_a024" id="a0242215-2cb6-44b9-b6ba-7cb952832d2b">
        <geometry xsi:type="esdl:Point" lat="53.449689" lon="5.693726"/>
        <port xsi:type="esdl:InPort" id="98acfe44-f71b-4ae6-bd01-b17b05355572" name="In" connectedTo="1d03c609-3efb-4450-9c34-8d51c3f1323b" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="a8e9ba14-67b4-4a6f-918c-991d842cb0bc" carrier="Electricity" name="Out" connectedTo="195d3063-cc90-402c-9878-6f8b430164ec 271ec3fa-3de0-450e-a8cc-1ee4775025ed 6da276f2-ea9e-456b-8089-e17561e26546"/>
      </asset>
      <asset xsi:type="esdl:Transformer" name="Transformer_3b49" id="3b49536f-abbe-4b8e-a298-2b96de5419e5">
        <geometry xsi:type="esdl:Point" lat="53.447193" lon="5.770639"/>
        <port xsi:type="esdl:InPort" id="c7de5139-7714-49eb-9de0-871facefd474" name="In" connectedTo="2d48403c-3acc-46a7-b2fe-a680bf04bd92" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="9820f773-7569-4b52-908c-60c57951bbe9" carrier="Electricity" name="Out" connectedTo="fc8270e1-9757-4cd7-82fd-c5801a63102a cff29b01-275c-4b95-9919-5aaf63e2af57 73868071-6b57-43ed-a4d8-1e43b8090c20"/>
      </asset>
      <asset xsi:type="esdl:Transformer" name="Transformer_cbd4" id="cbd45fb5-6bdb-4695-a302-d7c263b0539c">
        <geometry xsi:type="esdl:Point" lat="53.446609" lon="5.762694"/>
        <port xsi:type="esdl:InPort" id="a73523d2-0790-461f-8763-577feeebbe2b" name="In" connectedTo="e2e26686-130c-42eb-b128-a4869d612f53 dd0d4e78-e775-4ada-ac7d-26535f6291f6" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="f23bcab6-91b8-4e62-9dc2-5f70e1e8bacd" carrier="Electricity" name="Out" connectedTo="859fe52c-d915-4c2e-9500-810279e1a142 be6b9c5b-db1a-4f96-a7ca-82b610a4edbc"/>
      </asset>
      <asset xsi:type="esdl:Transformer" name="Transformer_aa14" id="aa145d68-acd5-457c-9682-f2b6791965ef">
        <geometry xsi:type="esdl:Point" lat="53.451529" lon="5.776062"/>
        <port xsi:type="esdl:InPort" id="766bbc26-4d10-44c9-b49c-06f597af1dbd" name="In" connectedTo="fc3fee9c-172e-491b-b46b-662556d36e8d" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="625ea875-e36e-4f13-bbab-d0a588094346" carrier="Electricity" name="Out" connectedTo="3e0bf8d9-925d-40c5-a235-f3fcd330acd4 b7dcc2aa-77b9-428a-a578-1c7ebbfae1ca 25bc8c61-a1c0-4289-9cb8-2dac52488e05"/>
      </asset>
      <asset xsi:type="esdl:Transformer" name="Transformer_4182" id="4182ec56-996f-466b-9b80-62a219f975fb">
        <geometry xsi:type="esdl:Point" lat="53.447682" lon="5.799022"/>
        <port xsi:type="esdl:InPort" id="2b2cb5e4-ed9d-4638-b06b-72f0bb4e3d08" name="In" connectedTo="f1991a32-3f96-468d-9573-025cfc540545" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="1f48843e-80a7-4f2d-ada9-0faeb91ca3cd" carrier="Electricity" name="Out" connectedTo="69ae5d15-6c05-453e-9891-bced8d270c18 105f415a-f32e-4884-b107-404616e274b2 caba809c-d80b-4ef8-9fe1-bd9d35c654e1"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="8753.569198" name="ElectricityCable_d72ce913-9914-4df0-b6b7-4369aad3228f" id="d72ce913-9914-4df0-b6b7-4369aad3228f">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.379028" lon="5.903778"/>
          <point xsi:type="esdl:Point" lat="53.444717" lon="5.830994"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="20ea73ed-1f6f-4e8f-917a-c1b3f66384e0" name="In" connectedTo="bba6eee8-0f66-44f7-b57b-3d5ca52539f9" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="aa4f6960-0a67-4909-9fc7-cde8cf1b6d8e" carrier="Electricity" name="Out" connectedTo="82960e12-61d6-4f01-a182-6b5813209a5c"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="4671.311059" name="ElectricityCable_904431bf-4d46-4aaf-9601-8ab134f1b102" id="904431bf-4d46-4aaf-9601-8ab134f1b102">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.444666" lon="5.829878"/>
          <point xsi:type="esdl:Point" lat="53.440116" lon="5.805931"/>
          <point xsi:type="esdl:Point" lat="53.440576" lon="5.784044"/>
          <point xsi:type="esdl:Point" lat="53.446547" lon="5.762796"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="82960e12-61d6-4f01-a182-6b5813209a5c" name="In" connectedTo="aa4f6960-0a67-4909-9fc7-cde8cf1b6d8e" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="e2e26686-130c-42eb-b128-a4869d612f53" carrier="Electricity" name="Out" connectedTo="a73523d2-0790-461f-8763-577feeebbe2b"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="514.863514" name="ElectricityCable_3154ec0c-ff10-44f3-9214-3dd646867041" id="3154ec0c-ff10-44f3-9214-3dd646867041">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.44661" lon="5.762844"/>
          <point xsi:type="esdl:Point" lat="53.447187" lon="5.770558"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="be6b9c5b-db1a-4f96-a7ca-82b610a4edbc" name="In" connectedTo="f23bcab6-91b8-4e62-9dc2-5f70e1e8bacd" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="2d48403c-3acc-46a7-b2fe-a680bf04bd92" carrier="Electricity" name="Out" connectedTo="c7de5139-7714-49eb-9de0-871facefd474 30d4204a-4687-4b4f-ad2c-e894d5e30882 9013f8c2-9e4f-4668-a2f9-1e0461521dee"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="587.489228" name="ElectricityCable_216f5e73-6f3f-4967-9efe-a46d01dcdc76" id="216f5e73-6f3f-4967-9efe-a46d01dcdc76">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.447238" lon="5.770649"/>
          <point xsi:type="esdl:Point" lat="53.451478" lon="5.775944"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="30d4204a-4687-4b4f-ad2c-e894d5e30882" name="In" connectedTo="2d48403c-3acc-46a7-b2fe-a680bf04bd92" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="fc3fee9c-172e-491b-b46b-662556d36e8d" carrier="Electricity" name="Out" connectedTo="766bbc26-4d10-44c9-b49c-06f597af1dbd"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="1856.460241" name="ElectricityCable_50344fe3-4e3e-478f-acb0-7d3678f4f3e0" id="50344fe3-4e3e-478f-acb0-7d3678f4f3e0">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.447174" lon="5.770714"/>
          <point xsi:type="esdl:Point" lat="53.447721" lon="5.798732"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9013f8c2-9e4f-4668-a2f9-1e0461521dee" name="In" connectedTo="2d48403c-3acc-46a7-b2fe-a680bf04bd92" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="f1991a32-3f96-468d-9573-025cfc540545" carrier="Electricity" name="Out" connectedTo="2b2cb5e4-ed9d-4638-b06b-72f0bb4e3d08"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="4937.682265" name="ElectricityCable_b1dc3a0d-df30-41b3-b5f6-a7682b4979f0" id="b1dc3a0d-df30-41b3-b5f6-a7682b4979f0">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.446537" lon="5.762686"/>
          <point xsi:type="esdl:Point" lat="53.44597" lon="5.762351"/>
          <point xsi:type="esdl:Point" lat="53.446302" lon="5.739241"/>
          <point xsi:type="esdl:Point" lat="53.445484" lon="5.716753"/>
          <point xsi:type="esdl:Point" lat="53.446689" lon="5.693761"/>
          <point xsi:type="esdl:Point" lat="53.449561" lon="5.693761"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="859fe52c-d915-4c2e-9500-810279e1a142" name="In" connectedTo="f23bcab6-91b8-4e62-9dc2-5f70e1e8bacd" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="1d03c609-3efb-4450-9c34-8d51c3f1323b" carrier="Electricity" name="Out" connectedTo="98acfe44-f71b-4ae6-bd01-b17b05355572 a812d517-6893-494d-acf7-ab298c640b09"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="859.559754" name="ElectricityCable_e178d110-b946-4454-8717-274df9afda52" id="e178d110-b946-4454-8717-274df9afda52">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.44958" lon="5.69367"/>
          <point xsi:type="esdl:Point" lat="53.446679" lon="5.693525"/>
          <point xsi:type="esdl:Point" lat="53.446769" lon="5.68624"/>
          <point xsi:type="esdl:Point" lat="53.446286" lon="5.686369"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a812d517-6893-494d-acf7-ab298c640b09" name="In" connectedTo="1d03c609-3efb-4450-9c34-8d51c3f1323b" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="1671aa2f-7da7-4c59-a7c0-078b4da083a8" carrier="Electricity" name="Out" connectedTo="0ffc4b9b-35e7-4abe-8838-9a3c1a744ce3 b1e2d9b5-c284-478b-9bf9-daffe0f8bf2f"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="4005.918797" name="ElectricityCable_2c877388-9f0c-444f-adb8-5e67ba3f4650" id="2c877388-9f0c-444f-adb8-5e67ba3f4650">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.446283" lon="5.686288"/>
          <point xsi:type="esdl:Point" lat="53.44673" lon="5.686176"/>
          <point xsi:type="esdl:Point" lat="53.445983" lon="5.680742"/>
          <point xsi:type="esdl:Point" lat="53.447273" lon="5.670104"/>
          <point xsi:type="esdl:Point" lat="53.445433" lon="5.65783"/>
          <point xsi:type="esdl:Point" lat="53.44666" lon="5.642295"/>
          <point xsi:type="esdl:Point" lat="53.446123" lon="5.640621"/>
          <point xsi:type="esdl:Point" lat="53.438392" lon="5.639114"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="b1e2d9b5-c284-478b-9bf9-daffe0f8bf2f" name="In" connectedTo="1671aa2f-7da7-4c59-a7c0-078b4da083a8" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="45ba8cc6-0fef-4810-a9b6-078b38955ed8" carrier="Electricity" name="Out" connectedTo="a369ca8b-cfc5-46ba-9f9b-7e2860f893d4 ab9a5335-675b-4532-87d8-4354629808ef"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="1700.157891" name="ElectricityCable_8109e751-fef2-4a3a-9410-df826438d12d" id="8109e751-fef2-4a3a-9410-df826438d12d">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.4384" lon="5.639004"/>
          <point xsi:type="esdl:Point" lat="53.44613" lon="5.64045"/>
          <point xsi:type="esdl:Point" lat="53.445689" lon="5.637177"/>
          <point xsi:type="esdl:Point" lat="53.445877" lon="5.635219"/>
          <point xsi:type="esdl:Point" lat="53.450083" lon="5.636971"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ab9a5335-675b-4532-87d8-4354629808ef" name="In" connectedTo="45ba8cc6-0fef-4810-a9b6-078b38955ed8" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="b451396a-2e73-4a9d-bebf-de9340294f46" carrier="Electricity" name="Out" connectedTo="b09cdd59-fd4f-4d15-a100-83e72ae37560"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="6074.490636" name="ElectricityCable_bb8526bf-c4c4-495a-b009-29e04af60efc" id="bb8526bf-c4c4-495a-b009-29e04af60efc">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.450021" lon="5.67461"/>
          <point xsi:type="esdl:Point" lat="53.449919" lon="5.683279"/>
          <point xsi:type="esdl:Point" lat="53.446804" lon="5.686235"/>
          <point xsi:type="esdl:Point" lat="53.446765" lon="5.693648"/>
          <point xsi:type="esdl:Point" lat="53.446717" lon="5.696594"/>
          <point xsi:type="esdl:Point" lat="53.446264" lon="5.705241"/>
          <point xsi:type="esdl:Point" lat="53.445612" lon="5.716646"/>
          <point xsi:type="esdl:Point" lat="53.446583" lon="5.739348"/>
          <point xsi:type="esdl:Point" lat="53.446091" lon="5.762243"/>
          <point xsi:type="esdl:Point" lat="53.446577" lon="5.762571"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="e0abee7c-584e-4caf-8d8c-f964aa91cfb4" name="In" connectedTo="ac83e27d-6ae4-462e-aff6-c3fde9641881" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="dd0d4e78-e775-4ada-ac7d-26535f6291f6" carrier="Electricity" name="Out" connectedTo="a73523d2-0790-461f-8763-577feeebbe2b"/>
      </asset>
      <asset xsi:type="esdl:PVPark" power="6000000.0" name="Zonnepark vliegveld" id="7aedbc1f-1486-4904-af77-77167f6fa90f">
        <geometry xsi:type="esdl:Point" lat="53.450043" lon="5.674519"/>
        <port xsi:type="esdl:OutPort" id="ac83e27d-6ae4-462e-aff6-c3fde9641881" carrier="Electricity" name="Out" connectedTo="e0abee7c-584e-4caf-8d8c-f964aa91cfb4">
          <profile xsi:type="esdl:SingleValue" id="78fa3354-539b-4c6c-bd7e-b4c1545fc344" profileType="ENERGY_IN_TJ"/>
        </port>
      </asset>
      <asset xsi:type="esdl:GenericProducer" power="1000000000.0" name="Elektriciteitslevering vaste land" id="61ff6702-14eb-4a47-b8dd-71ee4ae14cd3" prodType="FOSSIL">
        <costInformation xsi:type="esdl:CostInformation">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.8" name="GenericProducer_61ff-MarginalCosts" id="d7e25dee-1cc5-4d7d-ae49-27a9ff5f6a1e"/>
        </costInformation>
        <geometry xsi:type="esdl:Point" lat="53.375136" lon="5.899315"/>
        <port xsi:type="esdl:OutPort" id="d693eb31-40d2-4c7f-84ee-2e8be412e1ce" carrier="Electricity" name="Out" connectedTo="a40fced1-6530-49e0-9321-2126efa9fb67"/>
      </asset>
      <asset xsi:type="esdl:GenericConsumer" name="Elektriciteitsconsumptie vaste land" power="1000000000.0" id="4e4699e5-4450-4382-9356-ccdc886c5659">
        <costInformation xsi:type="esdl:CostInformation">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.1" name="GenericConsumer_4e46-MarginalCosts" id="19b73fd2-8edb-4f51-871e-26c72c51dad9"/>
        </costInformation>
        <geometry xsi:type="esdl:Point" lat="53.378413" lon="5.912361"/>
        <port xsi:type="esdl:InPort" id="c05c0390-434a-4d85-b4ae-4b67bc7185b1" name="In" connectedTo="bba6eee8-0f66-44f7-b57b-3d5ca52539f9" carrier="Electricity"/>
      </asset>
      <asset xsi:type="esdl:ElectricityNetwork" name="ElectricityNetwork_bb43" id="bb434bf4-8100-4678-9145-4cc2980d3970">
        <geometry xsi:type="esdl:Point" lat="53.378209" lon="5.904722"/>
        <port xsi:type="esdl:InPort" id="a40fced1-6530-49e0-9321-2126efa9fb67" name="In" connectedTo="d693eb31-40d2-4c7f-84ee-2e8be412e1ce" carrier="Electricity"/>
        <port xsi:type="esdl:OutPort" id="bba6eee8-0f66-44f7-b57b-3d5ca52539f9" carrier="Electricity" name="Out" connectedTo="20ea73ed-1f6f-4e8f-917a-c1b3f66384e0 c05c0390-434a-4d85-b4ae-4b67bc7185b1"/>
      </asset>
      <asset xsi:type="esdl:GasNetwork" name="GasNetwork_8ed5" id="8ed55353-17c3-4941-9fa9-14aa49a3b5d5">
        <geometry xsi:type="esdl:Point" lat="53.439503" lon="5.782242"/>
        <port xsi:type="esdl:InPort" id="476de590-6cfc-4586-ab14-55f1e327cdb2" name="In" connectedTo="d78ed7f7-ee7d-492e-9145-f572ab5f4e7c" carrier="NaturalGas"/>
        <port xsi:type="esdl:OutPort" id="26aecda5-115c-4d69-bd8f-d3df0e98587e" carrier="NaturalGas" name="Out" connectedTo="ac8bffb2-82b7-43cc-8ec1-d4e3984fb623 08cc2650-3783-46c8-a79b-bf9ad2468ab6 8eb16b6d-c283-4882-bf9d-bd4ee3c429f3 ffa7f5e4-e06c-4765-bbb2-00b9ec860def ae4b29a8-8ce3-450b-b6f2-5e62e8168435 603c40c5-3061-4a22-989f-ca1fb73db115 9ea9fab6-b6b6-44c5-bd9d-c364defb19e2"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="9662.359221" name="Pipe_0e5acb27-7581-4d79-abe0-33f06c28c3c1" id="0e5acb27-7581-4d79-abe0-33f06c28c3c1">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.365304" lon="5.859833"/>
          <point xsi:type="esdl:Point" lat="53.439055" lon="5.782757"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="4b7bd915-1c1e-4f02-876a-e7f0febb5431" name="In" connectedTo="d86e681d-0653-4e13-a59f-bb3a9e4e9948" carrier="NaturalGas"/>
        <port xsi:type="esdl:OutPort" id="d78ed7f7-ee7d-492e-9145-f572ab5f4e7c" carrier="NaturalGas" name="Out" connectedTo="476de590-6cfc-4586-ab14-55f1e327cdb2"/>
      </asset>
      <asset xsi:type="esdl:GasNetwork" name="GasNetwork_9d4c" id="9d4c7847-2f32-46fd-bfa1-f1273867d9b7">
        <geometry xsi:type="esdl:Point" lat="53.36346" lon="5.861206"/>
        <port xsi:type="esdl:InPort" id="1f15325a-57d9-4b29-a08f-a8a520578422" name="In" connectedTo="05ca2601-2f94-45da-b60b-478bda527eca" carrier="NaturalGas"/>
        <port xsi:type="esdl:OutPort" id="d86e681d-0653-4e13-a59f-bb3a9e4e9948" carrier="NaturalGas" name="Out" connectedTo="4b7bd915-1c1e-4f02-876a-e7f0febb5431"/>
      </asset>
      <asset xsi:type="esdl:GenericProducer" power="1000000000.0" name="Gaslevering vaste land" id="655ecd75-049e-43d8-b1db-9d61998ad608" prodType="FOSSIL">
        <geometry xsi:type="esdl:Point" lat="53.359311" lon="5.856657"/>
        <port xsi:type="esdl:OutPort" id="05ca2601-2f94-45da-b60b-478bda527eca" carrier="NaturalGas" name="Out" connectedTo="1f15325a-57d9-4b29-a08f-a8a520578422"/>
      </asset>
      <asset xsi:type="esdl:MobilityDemand" sector="e226e93d-dbac-492a-923a-874f5b4cd530" name="MobilityDemand Veerpont" id="79a6bb2e-be50-46f4-b10a-78cf6b50d398">
        <geometry xsi:type="esdl:Point" lat="53.393157" lon="5.764732"/>
        <port xsi:type="esdl:InPort" id="d3adc1f8-484e-45fe-aa7d-74ad57652587" name="In" connectedTo="0a12f3fb-ebb4-4c2d-8102-cf5104ec2b1f" carrier="e6badcc1-f266-494c-a3f2-cb1ed348db6c">
          <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="constant" id="c562e215-93c0-4899-ab68-e5fa32078a7d" database="energy_profiles" multiplier="135.0" profileType="ENERGY_IN_TJ" field="value" port="8086" host="http://10.30.2.1"/>
        </port>
      </asset>
      <asset xsi:type="esdl:MobilityDemand" sector="e226e93d-dbac-492a-923a-874f5b4cd530" name="MobilityDemand eiland" id="e0ba7e5f-cd9c-4acb-ae77-065f8d2ebe57">
        <geometry xsi:type="esdl:Point" lat="53.450008" lon="5.826316"/>
        <port xsi:type="esdl:InPort" id="d57dce0f-f7b0-414f-acb1-5fe857d2bda0" name="In" connectedTo="c7169860-5a4c-4465-b2d4-3118cfa4017c" carrier="b36f5cfb-6e95-4673-bb48-4d6a3d0db5d5">
          <profile xsi:type="esdl:InfluxDBProfile" filters="" measurement="constant" id="a2b9dde2-42a2-41cc-bd56-788c5a0559db" database="energy_profiles" multiplier="75.0" profileType="ENERGY_IN_TJ" field="value" port="8086" host="http://10.30.2.1"/>
        </port>
      </asset>
      <asset xsi:type="esdl:GenericProducer" power="1000000000.0" name="Diesel Veerpont" id="1097229c-cc7e-46ee-ad91-3e5ebf25b197" prodType="FOSSIL">
        <geometry xsi:type="esdl:Point" lat="53.395613" lon="5.760612"/>
        <port xsi:type="esdl:OutPort" id="0a12f3fb-ebb4-4c2d-8102-cf5104ec2b1f" carrier="e6badcc1-f266-494c-a3f2-cb1ed348db6c" name="Out" connectedTo="d3adc1f8-484e-45fe-aa7d-74ad57652587"/>
      </asset>
      <asset xsi:type="esdl:GenericProducer" power="1000000000.0" name="Benzine vervoer" id="ed103768-be65-429c-9e94-1cd108ab0940" prodType="FOSSIL">
        <geometry xsi:type="esdl:Point" lat="53.449957" lon="5.824213"/>
        <port xsi:type="esdl:OutPort" id="c7169860-5a4c-4465-b2d4-3118cfa4017c" carrier="b36f5cfb-6e95-4673-bb48-4d6a3d0db5d5" name="Out" connectedTo="d57dce0f-f7b0-414f-acb1-5fe857d2bda0"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
