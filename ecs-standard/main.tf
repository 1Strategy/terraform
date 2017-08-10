# Establish provider
provider "aws" {
  region = "us-west-2"
  profile = "default"
  # assume_role {
  #   role_arn = "arn:aws:iam::842337631775:role/1S-Admins"
  # }
}
