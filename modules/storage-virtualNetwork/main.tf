resource "azurerm_resource_group" "matchmyresume" {
  name     = "matchmyresume-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "matchmyresume" {
  name                     = "matchmyresumestorageaccount"
  resource_group_name      = azurerm_resource_group.matchmyresume.name
  location                 = azurerm_resource_group.matchmyresume.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "matchmyresume" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.matchmyresume.name
  container_access_type = "private"
}

resource "azurerm_virtual_network" "matchmyresume" {
  name                = "matchmyresume-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.matchmyresume.location
  resource_group_name = azurerm_resource_group.matchmyresume.name
}

resource "azurerm_subnet" "public" {
  name                 = "public-subnet"
  resource_group_name  = azurerm_resource_group.matchmyresume.name
  virtual_network_name = azurerm_virtual_network.matchmyresume.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "private" {
  name                 = "private-subnet"
  resource_group_name  = azurerm_resource_group.matchmyresume.name
  virtual_network_name = azurerm_virtual_network.matchmyresume.name
  address_prefixes     = ["10.0.2.0/24"]
}

