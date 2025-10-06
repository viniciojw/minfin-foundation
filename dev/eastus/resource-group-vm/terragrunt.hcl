# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the 
  # working directory, into a temporary folder, and execute your Terraform commands in that folder. 
  terraform { 
    source = "git::https://git@github.com/naturacode/terraform-module-resource-group.git?ref=main" 
      extra_arguments "custom_vars" { 
      commands = ["apply", "console", "destroy", "import", "plan", "push", "refresh"] 
      # With the get_terragrunt_dir() function, you can use relative paths! 
      arguments = [ 
        "-var-file=${get_terragrunt_dir()}/${find_in_parent_folders("region.tfvars")}", 
        "-var-file=${get_terragrunt_dir()}/${find_in_parent_folders("env.tfvars")}", 
        "-var-file=${get_terragrunt_dir()}/local.tfvars", 
        "-var-file=${get_terragrunt_dir()}/creation.tfvars", 
      ] 
    } 
  } 
  
  include { 
    path = find_in_parent_folders() 
  }