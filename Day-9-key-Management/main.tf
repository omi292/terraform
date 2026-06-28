resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "example" {
  ami           = "ami-0bc7aabcf58d1e02a"
  instance_type = "t3.micro"

  key_name = aws_key_pair.my_key.key_name
}