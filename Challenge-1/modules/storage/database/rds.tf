//Create DB subnet groups for RDS MySQL
resource "aws_db_subnet_group" "rds-db-subnet-grp" {
  name = "main"
  subnet_ids = var.db_subnet

  tags = {
    Name = "DB subnet group"
  }
}

//Create RDS instance with MySQL engine

resource "aws_db_instance" "my-rds" {
  identifier = "my-rds"
  engine = var.db_engine
  engine_version = var.db_version
  allocated_storage = "10"
  instance_class = "db.t2.micro"
  vpc_security_group_ids = var.db_sg
  name = var.db_name
  username = var.db_admin
  password = var.db_password
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = var.db_subnet
  skip_final_snapshot = true
  tags = {
    Name = "APP DB"
  }
}
