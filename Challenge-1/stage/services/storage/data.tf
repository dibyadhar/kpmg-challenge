#______________ DATA SECTION ________________
data "aws_vpc" "app_vpc" {
  filter {
    name = "tag:Name"
    values = [
      "Staging-Cloud"]
  }
}



data "aws_security_group" "rds_sg" {
  filter {
    name = "tag:Name"
    values = [
    "rds-sg"]
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
