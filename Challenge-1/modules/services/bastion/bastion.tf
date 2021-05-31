/*
   * Bastion Host
*/

resource "aws_instance" "bastion_host" {

  ami                    = var.bastion_ami_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = var.bastion_sg
  subnet_id              = var.bastion_subnet
  key_name               = var.bastion_key

  tags = {
    Name       = "bastion-host"
  }
}
