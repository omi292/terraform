# resource "aws_instance" "name" {
#   ami = "ami-0bc7aabcf58d1e02a"
#   instance_type = "t3.micro"
#   count = 2
# #   tags = {
# #     "name" = "dev"
# #   }
# tags = {
#   "Name" = "dev-${count.index}"
# }
#  }

 variable "env" {
   type = list(string)
   default = [ "dev", "test", "prod" ]
 }

 resource "aws_instance" "name" {
  ami = "ami-0bc7aabcf58d1e02a"
  instance_type = "t3.micro"
  count = length(var.env)
#   tags = {
#     "name" = "dev"
#   }
tags = {
  Name = var.env[count.index]
}
 }