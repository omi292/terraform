module "vpc" {
  source = "./modules/vpc"

  cidr_block = "10.0.0.0/16"
}

module "ec2" {
  source = "./modules/ec2"

  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t3.micro"
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "omkar-demo-terraform-bucket-123456"
}

module "rds" {
  source = "./modules/rds"

  db_name  = "mydb"
  username = "admin"
  password = "Password123"
}