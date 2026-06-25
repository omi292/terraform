terraform {
  backend "s3" {
    bucket = "newwwwwwww-pytho"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true # To use s3 native locking applied to verion 1.19 above
  }
}
