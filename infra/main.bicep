param location string = resourceGroup().location
param clusterName string = 'aks-pwc-project'

param systemNodeCount int = 1
param systemNodeVmSize string = 'Standard_D2s_v3'

param userNodeCount int = 1
param userNodeVmSize string = 'Standard_D2s_v3'

module aks './modules/aks.bicep' = {
  name: 'aksDeployment'
  params: {
    location: location
    clusterName: clusterName
    systemNodeCount: systemNodeCount
    systemNodeVmSize: systemNodeVmSize
    userNodeCount: userNodeCount
    userNodeVmSize: userNodeVmSize
  }
}

output aksClusterId string = aks.outputs.clusterId
output kubeletIdentityObjectId string = aks.outputs.kubeletIdentityObjectId
