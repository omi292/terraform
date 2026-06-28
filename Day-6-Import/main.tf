resource "aws_instance" "name" {
  ami = "ami-0bc7aabcf58d1e02a"
  instance_type = "t3.micro"
  tags = {
    "Name" = "test"
  }
}

# command:
# terraform import aws_instance.name i-0483e1c85e1adedf5