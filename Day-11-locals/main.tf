locals {
  bucket_name = "${var.layer}-${var.env}-bucket-hydnaresh"
}

resource "aws_s3_bucket" "demo" {
  # bucket = "web-dev-bucket"

  # bucket = "${var.layer}-${var.env}-bucket-hyd"

  bucket = local.bucket_name

  tags = {
    # Name = "${var.layer}-${var.env}-bucket-hyd"

    Name        = local.bucket_name
    Environment = var.env
  }
}