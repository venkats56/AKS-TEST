param location string
param vnetName string
param subnetName string

resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/8'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.240.0.0/16'
        }
      }
    ]
  }
}

output subnetId string = vnet.properties.subnets[0].id
