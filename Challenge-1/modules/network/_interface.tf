/*
  * Variables
*/

# Global 
variable "tag_owner" {
  type        = string
  description = "Owner email"
}


variable "tag_costcenter" {
  type        = string
  description = "Project costcode"
}

variable "no_of_subnets" {
  type        = string
  description = "No of resource to be deployed"
}

# VPC 
variable "vpc_cidr" {
  description = "CIDR range"
  type        = string
}

variable "tag_vpc_name" {
  description = "Friendly Name for VPC"
  type        = string
}

# SUBNETS

variable "public_cidr" {
  description = "Public CIDR Range"
  type        = list

}

variable "private_cidr" {
  description = "Public CIDR Range"
  type        = list

}

variable "availability_zones" {
  description = "AZ to deploy resources"
  type        = list

}

# Internet Gateway 
variable "tag_igw_name" {
  description = "Friendly Name for IGW"
  type        = string

}


# Security Groups
variable "ssh_cidr" {
  description = " Organisation or personal CIDR for SSH"
  type        = list
}

/*
   * Outputs
  
*/


output "vpc_id" {

  value = aws_vpc.vpc.id
}

output "public_subnet_id" {

  value = aws_subnet.public[*].id
}

output "private_subnet_id" {

  value = aws_subnet.private[*].id
}

output "nat_gw_id" {

  value = aws_nat_gateway.nat_gw[*].id
}

output "nat_eip" {

  value = aws_eip.nat_eip[*].public_ip
}
