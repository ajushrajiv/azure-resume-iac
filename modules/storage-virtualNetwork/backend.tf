terraform {
  backend "azurerm" {
    resource_group_name  = "matchmyresume-resources"
    storage_account_name = "matchmyresumestorageacc"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
