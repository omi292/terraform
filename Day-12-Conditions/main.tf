variable "region" {
  type    = string
  default = "ap-south-1"
}

locals {
  supported_regions = [
    "ap-south-1",
    "us-east-1"
  ]
}

resource "aws_s3_bucket" "demo" {

  count = contains(local.supported_regions, var.region) ? 1 : 0

  bucket = "demo-bucket-terraform-123456"

  tags = {
    Name   = "Demo Bucket"
    Region = var.region
  }
}

## Try boolean and count