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
    location: variablesModule.outputs.location
    aksClusterName: variablesModule.outputs.aksClusterName
    nodeCount: variablesModule.outputs.nodeCount
    subnetId: networkModule.outputs.subnetId 
  }
}
