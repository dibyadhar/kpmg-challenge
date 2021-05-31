
#_____________ TF CONFIGURATION ________________

terraform {
  required_providers {
    aws = "~> 2.0"
  }

  backend "s3" {
    bucket  = "kpmg-proj-remote-state"
    key     = "staging/vpc.tf"
    region  = "us-east-2"
    encrypt = true
  }
}

#___________ PROVIDER CONFIGURATION ______________

provider aws {
  region                  = "us-east-2"
  profile                 = "terraform"
  shared_credentials_file = "~/.aws/credentials"
}

#__________ VPC CONFIG ______________

module "kpmg_vpc" {

  source = "../../modules/network"

  no_of_subnets = var.no_of_subnets

  #VPC
  vpc_cidr     = var.vpc_cidr
  tag_vpc_name = var.vpc_name

  #Subnets
  public_cidr        = var.public_cidr
  private_cidr       = var.private_cidr
  availability_zones = var.availability_zones

  #IGW
  tag_igw_name = var.igw_name

  #Tags
  tag_owner      = var.tag_owner
  tag_costcenter = var.tag_costcenter


  # Security Group
  ssh_cidr = var.ssh_cidr

}
