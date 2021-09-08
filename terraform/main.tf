provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "core"
  subscription_id = "cecaf642-3d70-4be8-9083-e1ac9d0861fb"
}

######################## RESOURCE GROUP 1 ########################
resource "azurerm_resource_group" "example" {
  name     = "spring-app1"
  location = "UK South"
}
### CLUSTER ###
resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "spring-cluster"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "spring-cluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.cluster.kube_config_raw

  sensitive = true
}

######################## RESOURCE GROUP 2 ########################
resource "azurerm_resource_group" "kube-con" {
  name     = "MC_kspring-app1clusterp_myAKSCluster_uksouth"
  location = "UK South"
}

### VENT / SUBNET ###
resource "azurerm_virtual_network" "uk" {
  name                = "uk-network"
  resource_group_name = azurerm_resource_group.kube-con.name
  location            = azurerm_resource_group.kube-con.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "internal-uk" {
  name                 = "internal-uk"
  resource_group_name  = azurerm_resource_group.kube-con.name
  virtual_network_name = azurerm_virtual_network.uk.name
  address_prefixes     = ["10.0.2.0/24"]
}

# ### scale set ###
# resource "azurerm_linux_virtual_machine_scale_set" "uk-vmss" {
#   name                = "uk-vmss"
#   resource_group_name = azurerm_resource_group.kube-con.name
#   location            = azurerm_virtual_network.uk.location
#   sku                 = "Standard_B1ls"
#   instances           = 1
#   admin_username      = "admin10"

#   admin_ssh_key {
#     username   = "admin10"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }

#   os_disk {
#     storage_account_type = "Standard_LRS"
#     caching              = "ReadWrite"
#   }

#   network_interface {
#     name    = "uk-network"
#     primary = true

#     ip_configuration {
#       name      = "internal"
#       primary   = true
#       subnet_id = azurerm_subnet.internal-uk.id
#     }
#   }
# }



