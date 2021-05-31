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

variable "vpc_name" {
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
variable "igw_name" {
  description = "Friendly Name for IGW"
  type        = string

}

# Secuirty Group

variable "ssh_cidr" {
  description = "Organisation or personal CIDR for SSH"
  type        = list

}
