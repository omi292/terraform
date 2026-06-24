terraform {
  backend "s3" {
    bucket = "newwwwwwww-pytho"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
