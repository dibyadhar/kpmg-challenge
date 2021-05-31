/*
   * Configure a private sub-network space
*/

resource "aws_subnet" "private" {
  count = var.no_of_subnets
  
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "Private-Subnet-${var.availability_zones[count.index]}"
    Owner = var.tag_owner
    Costcenter = var.tag_costcenter
  }
}
