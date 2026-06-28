resource "aws_instance" "name" {
  ami = var.ami_id
  instance_type = var.type
  user_data = file("test.sh") # calling test.sh from currect directory
  }
