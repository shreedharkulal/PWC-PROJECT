param location string
param clusterName string

param systemNodeCount int = 1
param systemNodeVmSize string = 'Standard_D2as_v5'

param userNodeCount int = 1
param userNodeVmSize string = 'Standard_D2as_v5'

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
        count: systemNodeCount
        vmSize: systemNodeVmSize
        osType: 'Linux'
        mode: 'System'
        type: 'VirtualMachineScaleSets'
      }
    ]
  }
}

resource userPool 'Microsoft.ContainerService/managedClusters/agentPools@2025-02-01' = {
  parent: aks
  name: 'userpool'
  properties: {
    count: userNodeCount
    vmSize: userNodeVmSize
    osType: 'Linux'
    mode: 'User'
    type: 'VirtualMachineScaleSets'
  }
}

output clusterId string = aks.id
output kubeletIdentityObjectId string = aks.properties.identityProfile.kubeletidentity.objectId
