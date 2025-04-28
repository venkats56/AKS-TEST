// modules/aks.bicep

param location string
param aksClusterName string
param subnetId string
param aksNodeCount int
param aksVmSize string

resource aksCluster 'Microsoft.ContainerService/managedClusters@2021-03-01' = {
  name: aksClusterName
  location: location
  properties: {
    dnsPrefix: aksClusterName
    agentPoolProfiles: [
      {
        name: 'agentpool'
        count: aksNodeCount
        vmSize: aksVmSize
        osType: 'Linux'
        vnetSubnetID: subnetId
      }
    ]
    enableRBAC: true
  }
  tags: {
    owner: 'Venkata.Sai@neudesic.com'
  }
}

output aksClusterId string = aksCluster.id
output aksFqdn string = aksCluster.properties.fqdn


