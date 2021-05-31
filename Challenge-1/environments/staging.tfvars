# Global 

tag_owner = "KPMG-Cloud"
tag_costcenter = "112233"


# Network

no_of_subnets = 2
vpc_cidr = "10.0.0.0/16"
vpc_name = "Staging-Cloud"
private_cidr =  [
  "10.0.0.0/24",
  "10.0.1.0/24"]
public_cidr =  [
  "10.0.2.0/24",
  "10.0.3.0/24"]

availability_zones = ["us-east-2a", "us-east-2b"]
igw_name = "Staging-Gateway"
ssh_cidr = ["0.0.0.0/0"]   # This is for demo only, this is dangerous from security perspective

# Frontend

lb_name        = "example-app-lb"
app_name       = "example-app"
lb_type        = "application"

max_size       = 2
min_size       = 1
desired_capacity  = 2
ami_id         = "ami-0d9a6b6c74aafb9d7"
instance_type   = "t2.micro"
key_name        = "test"

bastion_ami_id = "ami-0d9a6b6c74aafb9d7"
bastion_key    = "test"


# Database

db_engine = "mysql"
db_name   = "mydb"
db_admin  = "dbadmin"
db_password = "SuperSecret"