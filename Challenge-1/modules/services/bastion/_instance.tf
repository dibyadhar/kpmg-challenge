/*
  * Variables
*/

variable "bastion_ami_id" {}
variable "bastion_subnet" {}
variable "bastion_key" {}
variable "bastion_sg" {
    type = list
    description = "SG for Bastion Host"
}


/*
  * Outputs
*/

output "bastion_ip" {

  value = aws_instance.bastion_host.private_ip

}