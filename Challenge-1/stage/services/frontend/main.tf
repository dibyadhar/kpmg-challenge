
#_______________ TF CONFIGURATION ________________

terraform {
  required_providers {
    aws = "~> 2.0"
  }

  backend "s3" {
    bucket  = "kpmg-proj-remote-state"
    key     = "staging/frontend.tf"
    region  = "us-east-2"
    encrypt = true
  }
}

#_____________ PROVIDER CONFIGURATION ______________

provider aws {
  region                  = "us-east-2"
  profile                 = "terraform"
  shared_credentials_file = "~/.aws/credentials"
}




#__________ FRONTEND CONFIG ______________

module "app-frontend" {

  source = "../../../modules/services/alb-asg"

  # Load Balancer
  lb_name    = var.lb_name
  lb_type    = var.lb_type
  vpc_id     = data.aws_vpc.app_vpc.id
  lb_sg      = data.aws_security_group.lb_sg.id
  lb_subnet  = data.aws_subnet.public_subnet.*.id
 
 
  # ASG
  asg_subnet       = data.aws_subnet.private_subnet.*.id
  max_size         = var.max_size
  min_size         = var.min_size
  desired_capacity = var.desired_capacity


  # Launch Template
  ami_id        = var.ami_id
  instance_type = var.instance_type
  asg_sg        = data.aws_security_group.asg_sg.*.id
  key_name      = var.key_name
  app_name      = var.app_name

  #Tags
  tag_owner      = var.tag_owner
  tag_costcenter = var.tag_costcenter

}

module "bastion" {

  source = "../../../modules/services/bastion"

  bastion_ami_id = var.bastion_ami_id
  bastion_sg     = [data.aws_security_group.bastion_sg.id]
  bastion_subnet = data.aws_subnet.public_subnet.0.id
  bastion_key    = var.bastion_key

}
