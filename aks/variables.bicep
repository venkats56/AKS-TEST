@description('Project-wide variables')

var location = 'westus'
var projectName = 'awesome-project'
var vnetName = '${projectName}-vnet'
var subnetName = '${projectName}-subnet'
var aksClusterName = '${projectName}-aks'
var nodeCount = 1

output location string = location
output vnetName string = vnetName
output subnetName string = subnetName
output aksClusterName string = aksClusterName
output nodeCount int = nodeCount
