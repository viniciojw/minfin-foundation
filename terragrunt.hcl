remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-storage"
    storage_account_name = "saterraform1754"
    container_name       = "terraform"
    key                  = "minfin-foundation/${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    terraform {
      backend "azurerm" {}
    }
  EOF
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    provider "azurerm" {
      features {}
      subscription_id = "fcf5d60d-25fe-420b-8217-72c34a3c2c8d"
    }
  EOF
}




