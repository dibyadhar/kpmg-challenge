#______________ DATA SECTION ________________
data "aws_vpc" "app_vpc" {
  filter {
    name = "tag:Name"
    values = [
      "Staging-Cloud"]
  }
}


data "aws_security_group" "bastion_sg" {
  filter {
    name = "tag:Name"
    values = [
    "bastion-sg"]
  }
}

data "aws_security_group" "asg_sg" {
  filter {
    name = "tag:Name"
    values = [
    "asg-sg"]
  }
}

data "aws_security_group" "lb_sg" {
  filter {
    name = "tag:Name"
    values = [
      "elb-sg"]
  }
}


data "aws_subnet" "public_subnet" {
  count = length(var.availability_zones)
  filter {
    name = "tag:Name"
    values = [
      "Public-Subnet-${var.availability_zones[count.index]}"]
  }
}

data "aws_subnet" "private_subnet" {
  count = length(var.availability_zones)
  filter {
    name = "tag:Name"
    values = [
     "Private-Subnet-${var.availability_zones[count.index]}"]
  }
}
