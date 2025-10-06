locals {
  project = "minfin-foundation"

  # Remote state storage (create once if it doesn't exist yet; see note below)
  backend = {
    resource_group_name  = "rg-storage"          # <-- change if you use another RG
    storage_account_name = "saterraform1754"      # <-- CHANGE to your Storage Account name
    container_name       = "terraform"
    key_prefix           = local.project
  }
}

# Terragrunt-style remote state (correct syntax)
remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = local.backend.resource_group_name
    storage_account_name = local.backend.storage_account_name
    container_name       = local.backend.container_name
    key                  = "${local.backend.key_prefix}/${path_relative_to_include()}.tfstate"
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




