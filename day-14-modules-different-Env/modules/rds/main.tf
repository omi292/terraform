resource "aws_db_instance" "this" {

  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"

  db_name              = var.db_name
  username             = var.username
  password             = var.password

  skip_final_snapshot  = true

  publicly_accessible  = true

  tags = {
    Name = "Terraform-RDS"
  }

}