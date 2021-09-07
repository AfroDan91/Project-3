
az login -u $AZ_ID_USR -p $AZ_ID_PSW
az aks get-credentials --resource-group k8group --name myAKSCluster