terraform {
  backend "azurerm" {
    resource_group_name  = "matchmyresume-resources"
    storage_account_name = "matchmyresumestorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
