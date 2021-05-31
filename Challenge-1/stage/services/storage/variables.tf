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

# RDS

variable "db_engine" {
  type = string
  
}

variable "db_name" {
  type = string
  
}

variable "db_admin"{
 type = string

}

variable "db_password"{
 type = string
 
}