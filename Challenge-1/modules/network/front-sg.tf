resource "aws_security_group" "asg_sg" {
  name = "asg_sg"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    security_groups = [
      aws_security_group.bastion_sg.id]
  }

  tags = {
    Name = "asg-sg"
    Costcenter = var.tag_costcenter
    Owner      = var.tag_owner
  }
}

resource "aws_security_group_rule" "allow_db" {
  type = "egress"
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
 
  security_group_id = aws_security_group.asg_sg.id
  source_security_group_id = aws_security_group.rds_sg.id
}

resource "aws_security_group_rule" "allow_http" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  security_group_id = aws_security_group.asg_sg.id
  source_security_group_id = aws_security_group.elb_sg.id
}

//Create SG for bastion  to restrict access
resource "aws_security_group" "bastion_sg" {
  name = "bastion_sg"
  description = "Allow traffic to pass from the private subnet to the internet"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.ssh_cidr
    //my IP it can be organisation CIDR range
  }

  egress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      var.vpc_cidr]
  }

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "bastion-sg"
  }
}

//Create SG for ELB  to restrict access
resource "aws_security_group" "elb_sg" {
  name = "elb-sg"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      var.vpc_cidr]
  }

  tags = {
    Name = "elb-sg"
    Costcenter = var.tag_costcenter
    Owner      = var.tag_owner
  }
}
