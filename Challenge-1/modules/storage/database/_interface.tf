/*
  * Variables
*/

variable "db_subnet" {}
variable "db_engine" {}
variable "db_version" {}
variable "db_name" {}
variable "db_admin" {}
variable "db_password" {}
variable "db_sg" {
    type = list
    description = "SG for RDS"
}