# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the 
  # working directory, into a temporary folder, and execute your Terraform commands in that folder. 
  terraform { 
    source = "git::https://git@github.com/marcusmleite/terraform-module-resource-group.git?ref=v1.0.5" 
      extra_arguments "custom_vars" { 
      commands = ["apply", "console", "destroy", "import", "plan", "push", "refresh"] 
      # With the get_terragrunt_dir() function, you can use relative paths! 
      arguments = [ 
        "-var-file=${find_in_parent_folders("location.tfvars")}", 
        "-var-file=${find_in_parent_folders("env.tfvars")}", 
        "-var-file=local.tfvars", 
        "-var-file=creation.tfvars", 
      ] 
    } 
  } 
  
include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}
