resource "aws_instance" "demo" {
  ami           = "ami-0bc7aabcf58d1e02a"
  instance_type = "t3.micro"

  tags = {
    Name = "taint-demo"
  }
}

# terraform apply -replace="aws_instance.demo"
