param location string
param clusterName string
param nodeCount int = 1
param nodeVmSize string = 'Standard_D2s_v5'

resource aks 'Microsoft.ContainerService/managedClusters@2025-02-01' = {
  name: clusterName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: clusterName
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: 'systempool'
        count: nodeCount
        vmSize: nodeVmSize
        osType: 'Linux'
        mode: 'System'
        type: 'VirtualMachineScaleSets'
      }
    ]
  }
}

output clusterId string = aks.id
output kubeletIdentityObjectId string = aks.properties.identityProfile.kubeletidentity.objectId
