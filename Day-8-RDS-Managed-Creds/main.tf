resource "aws_db_instance" "mysql" {
  identifier             = "terraform-mysql"

  engine                 = "mysql"
  engine_version         = "8.0"

  instance_class         = "db.t3.micro"   # Change if your account requires another free-tier eligible class

  allocated_storage      = 10
  max_allocated_storage  = 10
  storage_type           = "gp2"
  storage_encrypted      = true

  db_name                = "mydatabase"
  username     = "admin"

  # AWS will generate and manage the password
  manage_master_user_password = true # For managed credentials

  db_subnet_group_name   = "default-vpc-0f6b57457b2929ae8"

  vpc_security_group_ids = [
    "sg-0ba92faa52a04aab5"
  ]

  publicly_accessible    = false
  multi_az               = false

  backup_retention_period = 0

  auto_minor_version_upgrade = true
  apply_immediately          = true

  skip_final_snapshot    = true
  deletion_protection    = false

  performance_insights_enabled = false

  tags = {
    Name = "Terraform-MySQL-RDS"
  }
}


