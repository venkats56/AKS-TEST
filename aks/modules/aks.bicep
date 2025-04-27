param location string
param aksClusterName string
param nodeCount int   // Defaulting to 2
param subnetId string

resource aks 'Microsoft.ContainerService/managedClusters@2023-04-01' = {
  name: aksClusterName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: '${aksClusterName}-dns'
    agentPoolProfiles: [
      {
        name: 'nodepool1'
        count: nodeCount  
        vmSize: 'Standard_D2s_v3'  
        osType: 'Linux'
        type: 'VirtualMachineScaleSets'
        mode: 'System'
        vnetSubnetID: subnetId
      }
    ]
    networkProfile: {
      networkPlugin: 'azure'
    }
    addonProfiles: {
      kubeDashboard: {
        enabled: false
      }
      omsagent: {
        enabled: false
      }
    }
  }
}
