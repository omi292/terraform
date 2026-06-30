resource "aws_instance" "name" {
  ami = "ami-0bc7aabcf58d1e02a"
  instance_type = "t3.micro"
}

resource "aws_s3_bucket" "name" {
  bucket = "oqbobi23yey839uowhru92"
  provider = aws.us
}
