
remote_state {
  backend "azurerm" {
    resource_group_name  = "rg-storage"
    storage_account_name = "saterraform1754"
    container_name       = "terraform"
    key                  = "terraform-module-resource-group/terraform.tfstate"
  }
}