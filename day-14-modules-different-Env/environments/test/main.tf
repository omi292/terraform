module "vpc" {

  source = "../../modules/vpc"

  cidr_block = var.vpc_cidr

}

module "ec2" {

  source = "../../modules/ec2"

  ami           = var.ami
  instance_type = var.instance_type

}

module "s3" {

  source = "../../modules/s3"

  bucket_name = var.bucket_name

}

module "rds" {

  source = "../../modules/rds"

  db_name  = var.db_name
  username = var.username
  password = var.password

}