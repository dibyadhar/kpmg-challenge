/*
  * Deploys a managed NAT Gateway for egress internet connectivity
*/

resource "aws_eip" "nat_eip" {
  count = var.no_of_subnets
  vpc = true
  tags = {
    name = "nat-eip-${count.index}"
    Owner = var.tag_owner
    Costcenter = var.tag_costcenter

  }
}


resource "aws_nat_gateway" "nat_gw" {
  count = var.no_of_subnets
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id = aws_subnet.public[count.index].id

  tags = {
    Name = "NAT-GW-${count.index}"
    Owner = var.tag_owner
    Costcenter = var.tag_costcenter
  }
}
