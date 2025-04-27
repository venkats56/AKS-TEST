param location string='West US'
param storagename string = 'space${uniqueString(resourceGroup().id)}'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storagename
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'  // Changed from 'Standard' to 'Standard_LRS' as required by policy
  }
  properties: {
    accessTier: 'Cool'
  }
}
