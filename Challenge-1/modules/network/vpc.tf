/*
   * Configure a network space in public cloud to deploy resources and services
*/

resource "aws_vpc" "vpc" {
  
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  instance_tenancy = "default"
  
  tags = {
    Name  = var.tag_vpc_name
    Costcenter = var.tag_costcenter
    Owner      = var.tag_owner
  }
}
