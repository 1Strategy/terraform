# Establish provider
provider "aws" {
  region = "us-west-2"
  profile = "sandbox"
}

# Create resources
module "instance" {
  source = "github.com/1Strategy/terraform//tf_aws_modules/"
}
