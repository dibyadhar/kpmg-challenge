resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port = "3306"
    to_port = "3306"
    protocol = "tcp"
    security_groups = [
      aws_security_group.asg_sg.id]
  }
  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [
      var.vpc_cidr]
  }

  tags = {
    Name = "rds-sg"
    Costcenter = var.tag_costcenter
    Owner      = var.tag_owner
  }
}
