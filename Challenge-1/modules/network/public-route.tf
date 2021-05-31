/*
  * Create rules for public traffic
*/

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc.id
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
  
  tags = {
    Name = "Public-Route-Table"
    Owner = var.tag_owner
    Costcenter = var.tag_costcenter
    
  }
}

//Associate route table to public subnet
resource "aws_route_table_association" "public_route_association" {
  count = var.no_of_subnets
 
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_route.id
}
