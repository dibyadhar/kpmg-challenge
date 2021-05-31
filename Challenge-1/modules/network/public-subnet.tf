/*
   * Configure a sub-network space with internet connectivity
*/

resource "aws_subnet" "public" {
  count = var.no_of_subnets
  
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  
  tags = {
    Name = "Public-Subnet-${var.availability_zones[count.index]}"
    Owner = var.tag_owner
    Costcenter = var.tag_costcenter
  
  }
}
