# Establish Provider
provider "aws" {
  region  = "us-west-2"
  profile = "management"

  assume_role {
      # Sandbox Account
      role_arn = "arn:aws:iam::842337631775:role/1S-Admins"
  }
}