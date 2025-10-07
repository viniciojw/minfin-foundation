remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-tfstate-dev"
    storage_account_name = "saminfinstate039"
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
      subscription_id = "f8455db5-8609-4e4f-ba98-a3483a0f78ef"
    }
  EOF
}




