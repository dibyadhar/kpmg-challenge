
#_____________ TF CONFIGURATION ________________

terraform {
  required_providers {
    aws = "~> 2.0"
  }

}

#___________ PROVIDER CONFIGURATION ______________

provider aws {
  region                  = "us-east-2"
  profile                 = "terraform"
  shared_credentials_file = "~/.aws/credentials"
}

#__________ TF REMOTE STATE CONFIG ______________

module "terraform_state_bucket" {

  source = "../../modules/global"

  bucket_name     = var.bucket_name
  bucket_acl      = var.bucket_acl
  tag_owner       = var.tag_owner
  tag_costcenter  = var.tag_costcenter
  tag_role        = var.tag_role
  
}
