
# Establish provider
provider "aws" {
  region = "us-west-2"
  profile = "sandbox"
}

terraform {
  backend "s3" {
    region = "us-west-2"
    profile = "sandbox"
    bucket = "1s-terraform-example"
    key = "terraform-example.tfstate"
  }
}

# Create resources
module "test_instance" {
  source = "github.com/1Strategy/terraform//tf_aws_modules/"
  ssh_key = "ragraves_key"
  startup_script = <<EOF
sudo apt-get update -y
EOF
}

# data "terraform_remote_state" "remote_state" {
#   backend = "s3"
#   config {
#     region = "us-west-2"
#     profile = "management"
#     role_arn = "arn:aws:iam::842337631775:role/1S-Admins"
#     bucket = "1s-terraform-example"
#     key    = "terraform-example.tfstate"
#   }
# }
