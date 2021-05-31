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


# Load Balancer
variable "lb_name" {
  type        = string
  description = "Friendly Name of loadbalancer"
}

variable "lb_type" {
  type        = string
  description = "Application or Network"

}

variable "lb_sg" {
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"

}


variable "lb_subnet" {
  type        = list
  description = "Subnet where LB will be deployed"

}

# ASG

variable "asg_subnet" {
  type        = list
  description = "Subnet where ASG Instances will be deployed"

}

variable "max_size" {}
variable "min_size" {}
variable "desired_capacity" {}

# Launch Template
variable "ami_id" {}
variable "instance_type" {}
variable "asg_sg" {}
variable "key_name" {}
variable "app_name" {}


