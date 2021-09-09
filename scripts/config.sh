
az login --identity
cd terraform
terraform init
terraform apply -auto-approve
az aks get-credentials --resource-group spring-app1 --name spring-cluster