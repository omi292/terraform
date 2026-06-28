resource "aws_instance" "name" {
  ami = "ami-0bc7aabcf58d1e02ab"
  instance_type = "t3.micro"
  tags = {
    "Name" = "Dev" 
  }
  ## LifeCycle Rules 

# lifecycle {
#  create_before_destroy = true
# }

# lifecycle {
#  ignore_changes = [ tags, ]
# }
# lifecycle {
#  prevent_destroy = true
# }

}


