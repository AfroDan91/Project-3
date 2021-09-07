az login -u $AZURE_ID_USR -p $AZURE_ID_PSW
az aks get-credentials --resource-group k8group --name myAKSCluster