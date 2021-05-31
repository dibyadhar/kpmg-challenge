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

variable "availability_zones" {
  type        = list
}

# Load Balancer
variable "lb_name" {
  type        = string

}
variable "lb_type" {
  type        = string

}
variable "max_size" {
  type        = string

}
variable "min_size" {
  type        = string

}
variable "desired_capacity" {
  type        = string

}

# Launch Template
variable "ami_id" {
  type        = string

}
variable "instance_type" {
  type        = string
}
variable "key_name" {
 }

variable "app_name" {}

# Bastion Host
variable "bastion_ami_id" {
    type = string
    default = "ami-0d9a6b6c74aafb9d7"
}

variable "bastion_key" {}