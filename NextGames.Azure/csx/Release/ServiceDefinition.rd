<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="NextGames.Azure" generation="1" functional="0" release="0" Id="83f9a198-ef5b-44db-90b7-2bd454025894" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="NextGames.AzureGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="NextGames:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/NextGames.Azure/NextGames.AzureGroup/LB:NextGames:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="NextGames:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/NextGames.Azure/NextGames.AzureGroup/MapNextGames:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="NextGames:StorageConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/NextGames.Azure/NextGames.AzureGroup/MapNextGames:StorageConnectionString" />
          </maps>
        </aCS>
        <aCS name="NextGamesInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/NextGames.Azure/NextGames.AzureGroup/MapNextGamesInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:NextGames:Endpoint1">
          <toPorts>
            <inPortMoniker name="/NextGames.Azure/NextGames.AzureGroup/NextGames/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapNextGames:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/NextGames.Azure/NextGames.AzureGroup/NextGames/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapNextGames:StorageConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/NextGames.Azure/NextGames.AzureGroup/NextGames/StorageConnectionString" />
          </setting>
        </map>
        <map name="MapNextGamesInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/NextGames.Azure/NextGames.AzureGroup/NextGamesInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="NextGames" generation="1" functional="0" release="0" software="C:\Users\Stephen Avae\Documents\Visual Studio 2013\Projects\NextGames\NextGames.Azure\csx\Release\roles\NextGames" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="StorageConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;NextGames&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;NextGames&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/NextGames.Azure/NextGames.AzureGroup/NextGamesInstances" />
            <sCSPolicyUpdateDomainMoniker name="/NextGames.Azure/NextGames.AzureGroup/NextGamesUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/NextGames.Azure/NextGames.AzureGroup/NextGamesFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="NextGamesUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="NextGamesFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="NextGamesInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="56cc7087-591d-41d4-9328-cb10dde49185" ref="Microsoft.RedDog.Contract\ServiceContract\NextGames.AzureContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="36eed491-b33b-438b-86ee-c7564b4b984a" ref="Microsoft.RedDog.Contract\Interface\NextGames:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/NextGames.Azure/NextGames.AzureGroup/NextGames:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>