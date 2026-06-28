resource "aws_instance" "name" {
  ami = "ami-0bc7aabcf58d1e02ab"
  instance_type = "t3.micro"
  tags = {
    "Name" = "Dev" 
  }
 depends_on = [ aws_s3_bucket.name ]
}

resource "aws_s3_bucket" "name" {
  bucket = "doqbdobqoifwbvir"
}