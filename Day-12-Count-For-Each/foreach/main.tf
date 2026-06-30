 variable "env" {
   type = list(string)
   default = [ "dev", "test", "prod" ]
 }

 resource "aws_instance" "name" {
  ami = "ami-0bc7aabcf58d1e02a"
  instance_type = "t3.micro"
  for_each = toset(var.env)
#   tags = {
#     "name" = "dev"
#   }
tags = {
  Name = each.value
}
 }

 # diffrence between count and foreach important