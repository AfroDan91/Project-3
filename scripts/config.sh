
az login -u $AZ_EMAIL -p $AZ_PASS
az aks get-credentials --resource-group k8group --name myAKSCluster