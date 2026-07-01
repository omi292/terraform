variable "vpc_cidr" {}
variable "ami" {}
variable "instance_type" {}
variable "bucket_name" {}
variable "db_name" {}
variable "username" {}
variable "password" {
  sensitive = true
}