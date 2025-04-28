module variablesModule './variables.bicep' = {
  name: 'loadVariables'
}

module networkModule './modules/network.bicep' = {
  name: 'deployNetwork'
  params: {
    location: variablesModule.outputs.location
    vnetName: variablesModule.outputs.vnetName
    subnetName: variablesModule.outputs.subnetName
  }
}

module aksModule './modules/aks.bicep' = {
  name: 'deployAKS'
  params: {
    location: location
    aksClusterName: aksClusterName
    subnetId: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)
    aksNodeCount: aksNodeCount
    aksVmSize: aksVmSize
  }
}

