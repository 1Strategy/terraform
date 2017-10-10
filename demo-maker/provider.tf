# Establish Provider
provider "aws" {
  region  = "${var.aws_region}"
  profile = "management"

  assume_role {
      # Sandbox Account
      role_arn = "arn:aws:iam::842337631775:role/1S-Admins"
  }
}

terraform {
  backend "s3" {
    region = "us-west-2"
    profile = "management"
    role_arn = "arn:aws:iam::842337631775:role/1S-Admins"
    bucket = "1s-terraform-example"
    key = "terraform-demo-maker.tfstate"
  }
}