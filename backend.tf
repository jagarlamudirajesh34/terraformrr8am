terraform {
  backend "s3" {
    bucket = "radeops"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
