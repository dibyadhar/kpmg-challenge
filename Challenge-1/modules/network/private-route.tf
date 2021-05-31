/*
  * Create rules for private traffic
*/

resource "aws_route_table" "private_route" {
  count = var.no_of_subnets
  
  vpc_id = aws_vpc.vpc.id
   
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw[count.index].id
  }

  tags = {
    Name = "Private-Route-Table"
    Owner = var.tag_owner
    Costcenter = var.tag_costcenter
  }
}

//Associate route table to private subnet
resource "aws_route_table_association" "private_route_association" {
  count = var.no_of_subnets
  
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_route[count.index].id
}
