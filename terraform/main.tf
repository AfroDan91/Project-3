provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "scale-set-resources"
  location = "UK West"
}

