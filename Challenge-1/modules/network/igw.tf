/*
   * Create IGW to attach with public subnets
*/

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id
  
  tags = {
    Name  = var.tag_igw_name
    Owner = var.tag_owner
    Costcenter = var.tag_costcenter
  }


}
