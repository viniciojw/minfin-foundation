terraform {
  backend "azurerm" {
     resource_group_name  = "rg-storage"          # <-- change if you use another RG
    storage_account_name = "saterraform1754"      # <-- CHANGE to your Storage Account name
    container_name       = "terraform"
    key           = minfin-foundation/resource_group.tfstate
  }
}