<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="4" id="8056f6f5-9a49-4b13-9e3e-9cee1e7377c1" description="" esdlVersion="v2303" name="Untitled EnergySystem">
  <instance xsi:type="esdl:Instance" id="da84fc9c-a8f4-4bff-a0ee-bebf7fcb6c35" name="Untitled Instance">
    <area xsi:type="esdl:Area" id="a64a8c7f-bda1-44d2-8a51-af99579a94d9" name="Untitled Area">
      <area xsi:type="esdl:Area" type="BUILT" scope="VILLAGE" name="Monster" id="bb5429dc-fb95-4923-91dc-1f362b1a667f">
        <asset xsi:type="esdl:HeatingDemand" id="e11a2daa-2e56-4635-afb3-1e23c6d08c33" power="5000000.0" name="HeatingDemand_e11a">
          <port xsi:type="esdl:InPort" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="In" connectedTo="548795dd-37fa-4954-a795-2bae6cfb2596" id="493d8aba-4125-48e5-9f47-7f43b7e345dc">
            <profile xsi:type="esdl:InfluxDBProfile" startDate="2018-12-31T23:00:00.000000+0000" database="energy_profiles" host="http://influxdb" filters="" port="8086" multiplier="5.0" endDate="2019-12-31T22:00:00.000000+0000" field="demand1_MW" measurement="Unittests profiledata" id="e86dfcad-2f39-427a-b6dc-51db761b855c">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
            </profile>
          </port>
          <port xsi:type="esdl:OutPort" id="365a9824-9d8e-4a7b-bcdb-68cebed36d52" name="Out"/>
          <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.02553782230321" lon="4.172959327697755"/>
          <costInformation xsi:type="esdl:CostInformation" id="86259cde-c3dc-46ab-8799-c203b2b9d7d4">
            <fixedOperationalCosts xsi:type="esdl:SingleValue" value="2.0" id="01a049c7-3bdc-4a04-bdbc-24b2eaf93f36">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="9e66c346-3512-4cbe-954c-df2fa3c2ee2e" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </fixedOperationalCosts>
            <variableOperationalCosts xsi:type="esdl:SingleValue" value="2.0" id="52270a57-dd7d-4ea6-89de-f782e8a1b8a8">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="07bdd929-6127-4452-a861-d65a83283168" unit="EURO" description="Cost in EUR/MWh" perMultiplier="MEGA" physicalQuantity="COST"/>
            </variableOperationalCosts>
            <investmentCosts xsi:type="esdl:SingleValue" value="100.0" id="8620fe3f-1a1e-4246-ace2-40e8d489d75c">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="229ef840-e974-4c4c-b02a-ca075a46d8f0" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </investmentCosts>
            <installationCosts xsi:type="esdl:SingleValue" value="1000000.0" id="4da4c85d-1828-4641-9158-fbb1114b186a">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9a39a981-d846-4288-a718-4b5ec8598d1e" unit="EURO" description="Cost in EUR" physicalQuantity="COST"/>
            </installationCosts>
          </costInformation>
        </asset>
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="52.02165593534503" lon="4.159269332885743"/>
            <point xsi:type="esdl:Point" lat="52.02820477385976" lon="4.166393280029298"/>
            <point xsi:type="esdl:Point" lat="52.03227090872181" lon="4.175405502319337"/>
            <point xsi:type="esdl:Point" lat="52.02603953820683" lon="4.1825294494628915"/>
            <point xsi:type="esdl:Point" lat="52.02260663269074" lon="4.184160232543946"/>
            <point xsi:type="esdl:Point" lat="52.02028267017172" lon="4.173002243041993"/>
            <point xsi:type="esdl:Point" lat="52.02081085407391" lon="4.162616729736329"/>
          </exterior>
        </geometry>
      </area>
      <area xsi:type="esdl:Area" type="BUILT" scope="BUILDING" name="'s-Gravenzande" id="f03f94dd-fffe-436c-9932-0362145dcf1c">
        <asset xsi:type="esdl:HeatingDemand" id="c407387a-ebfd-41b7-af1b-9cae7aec842b" power="1000000.0" name="HeatingDemand_c407">
          <port xsi:type="esdl:InPort" id="0e326bde-62e3-49d0-9b50-96e538fc2d61" name="In">
            <profile xsi:type="esdl:InfluxDBProfile" startDate="2018-12-31T23:00:00.000000+0000" database="energy_profiles" host="http://influxdb" filters="" port="8086" endDate="2019-12-31T22:00:00.000000+0000" field="demand1_MW" measurement="Unittests profiledata" id="5244b9d2-c39e-49e8-8c90-7f1317ceff59">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
            </profile>
          </port>
          <port xsi:type="esdl:OutPort" connectedTo="e9d7860b-cb41-4e27-a0fd-3a82fd650521" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="Out" id="d8ca8f4f-045c-4e40-8fa5-37b1262f839e"/>
          <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.000735481096655" lon="4.162359237670899"/>
          <costInformation xsi:type="esdl:CostInformation" id="eee6a064-e369-4639-ae96-7f454457a74d">
            <fixedOperationalCosts xsi:type="esdl:SingleValue" value="100.0" id="62ed2ddf-0e10-43ac-9da1-6b3eaee602af">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="6023349b-d4a7-4260-b292-3a0b3d95e06b" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </fixedOperationalCosts>
            <variableOperationalCosts xsi:type="esdl:SingleValue" value="10.0" id="a53b10da-975c-4a75-a797-cf27c2b30290">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="cbe620ac-2c3d-47f6-98f7-ad442b2246ac" unit="EURO" description="Cost in EUR/MWh" perMultiplier="MEGA" physicalQuantity="COST"/>
            </variableOperationalCosts>
            <investmentCosts xsi:type="esdl:SingleValue" value="10000000.0" id="32a8388e-8f1e-4855-975b-7639fdefd529">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="3b484224-824d-465f-92be-17b84c28acfb" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </investmentCosts>
            <installationCosts xsi:type="esdl:SingleValue" value="10.0" id="c30c3288-85df-48c9-8490-d6110c827dd5">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="2ec7e97c-3f82-443a-a45e-38a32e66cdbc" unit="EURO" description="Cost in EUR" physicalQuantity="COST"/>
            </installationCosts>
          </costInformation>
        </asset>
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="52.00358884627429" lon="4.152488708496095"/>
            <point xsi:type="esdl:Point" lat="52.00469843916582" lon="4.158496856689454"/>
            <point xsi:type="esdl:Point" lat="52.00718171405585" lon="4.1578102111816415"/>
            <point xsi:type="esdl:Point" lat="52.009453525706625" lon="4.165878295898438"/>
            <point xsi:type="esdl:Point" lat="51.99761770750122" lon="4.172658920288087"/>
            <point xsi:type="esdl:Point" lat="51.99291421446105" lon="4.168281555175782"/>
            <point xsi:type="esdl:Point" lat="51.995979468253324" lon="4.1619300842285165"/>
            <point xsi:type="esdl:Point" lat="51.99560953496521" lon="4.1578102111816415"/>
          </exterior>
        </geometry>
      </area>
      <area xsi:type="esdl:Area" type="BUILT" scope="VILLAGE" name="Kassen" id="c669da88-8370-48b5-a531-ad50ca35e5ab">
        <asset xsi:type="esdl:HeatingDemand" id="e677bac5-48e0-4ac0-b2a9-5a329b00b0d6" power="10000000.0" name="HeatingDemand_e677">
          <port xsi:type="esdl:InPort" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="In" connectedTo="51ea03ea-3265-4d34-aafa-9a9d1459d7e5" id="b53f6e79-a4ca-4598-b88d-3c972e73c6b7">
            <profile xsi:type="esdl:InfluxDBProfile" startDate="2018-12-31T23:00:00.000000+0000" database="energy_profiles" host="http://influxdb" filters="" port="8086" multiplier="10.0" endDate="2019-12-31T22:00:00.000000+0000" field="demand5_MW" measurement="Unittests profiledata" id="8011de71-041f-4157-a128-09d60f5fe555">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
            </profile>
          </port>
          <port xsi:type="esdl:OutPort" id="19442782-cb6e-4b08-8ac9-7ce08b5739db" name="Out"/>
          <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.016902145509626" lon="4.18355941772461"/>
          <costInformation xsi:type="esdl:CostInformation" id="99ff585a-3335-49de-b3fa-5661f13ba164">
            <fixedOperationalCosts xsi:type="esdl:SingleValue" value="12.0" id="a644fc56-f4c1-4926-b4b8-ccf07e61c407">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="5baf89e6-2f7c-4f71-8ad7-c2757e7ad9fb" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </fixedOperationalCosts>
            <variableOperationalCosts xsi:type="esdl:SingleValue" value="2.0" id="2ca2f9d8-3ed6-4386-ba4b-c1b5c7b189c0">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="042e3b93-2dde-4d4e-a8d3-1c5d1a395ead" unit="EURO" description="Cost in EUR/MWh" perMultiplier="MEGA" physicalQuantity="COST"/>
            </variableOperationalCosts>
            <investmentCosts xsi:type="esdl:SingleValue" value="1000.0" id="7060c136-4c07-4bd0-bc25-e83a3e068cb2">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="08d8f97a-06ba-4724-a54a-0154ba54d5c2" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </investmentCosts>
            <installationCosts xsi:type="esdl:SingleValue" value="1000000.0" id="44c30d1a-4122-43ab-9bc1-1095aebfedc5">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="0d43cf49-2423-450f-83b7-dc34eafb59ce" unit="EURO" description="Cost in EUR" physicalQuantity="COST"/>
            </installationCosts>
          </costInformation>
        </asset>
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="52.019543202230835" lon="4.173774719238282"/>
            <point xsi:type="esdl:Point" lat="52.015951326919996" lon="4.175062179565431"/>
            <point xsi:type="esdl:Point" lat="52.01167239319138" lon="4.1790103912353525"/>
            <point xsi:type="esdl:Point" lat="52.010034668301536" lon="4.180040359497071"/>
            <point xsi:type="esdl:Point" lat="52.01140824806982" lon="4.196004867553712"/>
            <point xsi:type="esdl:Point" lat="52.02149748382286" lon="4.185190200805665"/>
          </exterior>
        </geometry>
      </area>
      <asset xsi:type="esdl:Pipe" innerDiameter="100.0" id="363103d6-a32e-40a6-b3a9-ae376c944f6b" name="Pipe_3631" length="1449.56">
        <port xsi:type="esdl:InPort" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="In" connectedTo="d8ca8f4f-045c-4e40-8fa5-37b1262f839e" id="e9d7860b-cb41-4e27-a0fd-3a82fd650521"/>
        <port xsi:type="esdl:OutPort" connectedTo="fe9e2f71-05b1-422e-bb57-d82a061b5594" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="Out" id="b0977aaf-539b-47d8-851e-7b83ec907fdc"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.000735481096655" lon="4.162359237670899"/>
          <point xsi:type="esdl:Point" lat="52.01293444715611" lon="4.154891967773438"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" id="f6779198-7d2a-456b-997b-58b9a02cdb2d" name="Joint_f677">
        <port xsi:type="esdl:InPort" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="In" connectedTo="b0977aaf-539b-47d8-851e-7b83ec907fdc" id="fe9e2f71-05b1-422e-bb57-d82a061b5594"/>
        <port xsi:type="esdl:OutPort" connectedTo="1daa9e0c-0de4-457f-85fd-66895f658df8" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="Out" id="5cb7a893-142c-4ca7-971f-7858e7f45790"/>
        <geometry xsi:type="esdl:Point" lat="52.01293444715611" lon="4.154891967773438"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="100.0" id="83582c37-b692-4432-8430-4e3407ed4c08" name="Pipe_8358" length="1047.58">
        <port xsi:type="esdl:InPort" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="In" connectedTo="5cb7a893-142c-4ca7-971f-7858e7f45790" id="1daa9e0c-0de4-457f-85fd-66895f658df8"/>
        <port xsi:type="esdl:OutPort" connectedTo="d842ae69-30d2-4b9a-b10a-e6e6688b4da0" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="Out" id="095e9c78-d231-496b-9b5e-f0f8c52956ed"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.01293444715611" lon="4.154891967773438"/>
          <point xsi:type="esdl:Point" lat="52.01304012354837" lon="4.154806137084962"/>
          <point xsi:type="esdl:Point" lat="52.01689793524064" lon="4.156265258789063"/>
          <point xsi:type="esdl:Point" lat="52.02036128352469" lon="4.162874221801759"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="100.0" id="a5142229-9331-4313-a52b-70c3da15f4a9" name="Pipe_a514" length="898.61">
        <port xsi:type="esdl:InPort" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="In" connectedTo="f4444ece-b032-4ad1-918a-c978ad5c90f8" id="6fb0e187-52e3-489f-a67d-d973bc2457d1"/>
        <port xsi:type="esdl:OutPort" connectedTo="493d8aba-4125-48e5-9f47-7f43b7e345dc" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="Out" id="548795dd-37fa-4954-a795-2bae6cfb2596"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.02036128352469" lon="4.162874221801759"/>
          <point xsi:type="esdl:Point" lat="52.02553782230321" lon="4.172959327697755"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" id="7aae2f5f-c3d4-4041-9577-d0a46124df09" name="Joint_7aae">
        <port xsi:type="esdl:InPort" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="In" connectedTo="095e9c78-d231-496b-9b5e-f0f8c52956ed 79ad557d-39b3-44c7-836a-6ec79c7d4781" id="d842ae69-30d2-4b9a-b10a-e6e6688b4da0"/>
        <port xsi:type="esdl:OutPort" connectedTo="6fb0e187-52e3-489f-a67d-d973bc2457d1" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="Out" id="f4444ece-b032-4ad1-918a-c978ad5c90f8"/>
        <geometry xsi:type="esdl:Point" lat="52.02036128352469" lon="4.162874221801759"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="100.0" id="737494af-8ac4-4ebe-a11a-e89f6f2c415a" name="Pipe_7374" length="1402.0">
        <port xsi:type="esdl:InPort" id="ed1ee852-391e-4fa2-bb2b-8498ac09a06f" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="In"/>
        <port xsi:type="esdl:OutPort" connectedTo="73c079d5-a78b-41b5-94d2-6ad2de30e74a" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="Out" id="47a92db4-77c9-47dc-a5a7-343755f8872f"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.01293444715611" lon="4.154977798461915"/>
          <point xsi:type="esdl:Point" lat="52.014810552247475" lon="4.161415100097657"/>
          <point xsi:type="esdl:Point" lat="52.012141703052286" lon="4.164419174194337"/>
          <point xsi:type="esdl:Point" lat="52.01427929604447" lon="4.171724170446397"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="100.0" id="0fc640c8-7f6b-45ae-8e40-2966c1377761" name="Pipe_0fc6" length="861.1">
        <port xsi:type="esdl:InPort" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="In" connectedTo="2f326088-6b83-41b1-a5b3-8a97ca27e0ed" id="4d1aa44f-2271-493a-80be-9202edff8074"/>
        <port xsi:type="esdl:OutPort" connectedTo="b53f6e79-a4ca-4598-b88d-3c972e73c6b7" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="Out" id="51ea03ea-3265-4d34-aafa-9a9d1459d7e5"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.01429003070183" lon="4.171749316155911"/>
          <point xsi:type="esdl:Point" lat="52.01549755696851" lon="4.175920486450196"/>
          <point xsi:type="esdl:Point" lat="52.016902145509626" lon="4.18355941772461"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" id="f5214b94-d097-4fa9-a86a-110a1386f884" name="Joint_f521">
        <port xsi:type="esdl:InPort" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="In" connectedTo="47a92db4-77c9-47dc-a5a7-343755f8872f" id="73c079d5-a78b-41b5-94d2-6ad2de30e74a"/>
        <port xsi:type="esdl:OutPort" connectedTo="4d1aa44f-2271-493a-80be-9202edff8074 b2657008-cfdd-4de8-9f5f-094c258e848d" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="Out" id="2f326088-6b83-41b1-a5b3-8a97ca27e0ed"/>
        <geometry xsi:type="esdl:Point" lat="52.01428322571835" lon="4.171739593148232"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="906.8" id="a0b0a95a-76c6-4afa-a319-f41297c5be6e" name="Pipe_a0b0" innerDiameter="100.0">
        <port xsi:type="esdl:InPort" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="In" connectedTo="2f326088-6b83-41b1-a5b3-8a97ca27e0ed" id="b2657008-cfdd-4de8-9f5f-094c258e848d"/>
        <port xsi:type="esdl:OutPort" connectedTo="d842ae69-30d2-4b9a-b10a-e6e6688b4da0" carrier="6f45c6f8-e8e2-4378-a910-45140337b9dd" name="Out" id="79ad557d-39b3-44c7-836a-6ec79c7d4781"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.01429354010849" lon="4.171727523207665"/>
          <point xsi:type="esdl:Point" lat="52.02036128352469" lon="4.162874221801759"/>
        </geometry>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="634d76d0-da49-4c7d-8ca9-bac7c1615c5b">
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="ebb28feb-25e3-4125-a441-28c16d25e2ef">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" unit="WATT" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA"/>
    </quantityAndUnits>
    <carriers xsi:type="esdl:Carriers" id="ad2f1427-e2d5-486b-b1ee-c9667e6b34b9">
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="70.0" name="HotSide" id="6f45c6f8-e8e2-4378-a910-45140337b9dd" returnTemperature="50.0">
        <cost xsi:type="esdl:SingleValue" value="5.0" id="28433470-e964-4f7e-8358-00fe39813d45">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="b4d08282-7b53-4d59-b983-21dccf48e5c7" unit="EURO" description="Cost in EUR/kWh" perMultiplier="KILO" physicalQuantity="COST"/>
        </cost>
      </carrier>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
