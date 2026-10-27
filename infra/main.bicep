param location string = resourceGroup().location
param clusterName string = 'aks-pwc-project'
param nodeCount int = 1
param nodeVmSize string = 'Standard_D2s_v5'

module aks './modules/aks.bicep' = {
  name: 'aksDeployment'
  params: {
    location: location
    clusterName: clusterName
    nodeCount: nodeCount
    nodeVmSize: nodeVmSize
  }
}

output aksClusterId string = aks.outputs.clusterId
output kubeletIdentityObjectId string = aks.outputs.kubeletIdentityObjectId
