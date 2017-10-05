
# Establish provider
provider "aws" {
  region = "us-west-2"
  profile = "management"
  assume_role {
    role_arn = "arn:aws:iam::842337631775:role/1S-Admins"
  }
}

terraform {
  backend "s3" {
    region = "us-west-2"
    profile = "management"
    role_arn = "arn:aws:iam::842337631775:role/1S-Admins"
    bucket = "1s-terraform-example"
    key = "terraform-example.tfstate"
  }
}

# Create resources
module "test_instance" {
  source = "github.com/1Strategy/terraform/modules/"
  ssh_key = "ragraves_key"
  name = "My-Terraform-Instance"
  startup_script = "${path.root}/startup.sh"
}
