
#_______________ TF CONFIGURATION ________________

terraform {
  required_providers {
    aws = "~> 2.0"
  }

  backend "s3" {
    bucket  = "kpmg-proj-remote-state"
    key     = "staging/database.tf"
    region  = "us-east-2"
    encrypt = true
  }
}

#_____________ PROVIDER CONFIGURATION ______________

provider aws {
  region                  = "us-east-2"
  profile                 = "terraform"
  shared_credentials_file = "~/.aws/credentials"
}




#__________ FRONTEND CONFIG ______________

module "app-storage" {

  source = "../../../modules/storage/database"

  db_engine = var.db_engine
  db_version = var.db_version
  db_name  = var.db_name
  db_admin = var.db_admin
  db_password = var.db_password
  db_sg   = data.aws_security_group.rds_sg
  db_subnet = data.aws_subnet.private_subnet.*.id
}

