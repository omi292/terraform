terraform {
  backend "s3" {
    bucket = "newwwwwwww-pytho"
    key    = "Day-2/terraform.tfstate"
    region = "ap-south-1"
  }
}
