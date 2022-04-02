terraform {
  backend "azurerm" {
    resource_group_name   = "jtecq-multistate"
    storage_account_name  = "jtecqmultistatestore"
    container_name        = "jtecq-multitstate-cont"
    key                   = "terraform-prod.tfstate"
  }
}