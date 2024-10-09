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
