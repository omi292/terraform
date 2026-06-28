resource "aws_instance" "name" {
  ami = "ami-0bc7aabcf58d1e02ab"
  instance_type = "t3.micro"
  tags = {
    "Name" = "Dev" 
  }

}

resource "aws_s3_bucket" "name" {
  bucket = "doqbdobqo"
}

# We can create a specific resource using below command
# terraform plan -target=aws_s3_bucket.name
# terraform apply -target=aws_s3_bucket.name
# terraform destroy -target=aws_s3_bucket.name