
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


# Create resources
module "test_instance" {
  source = "github.com/1Strategy/terraform//tf_aws_modules/"
  ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCGj9TwDOk37yXBKYkM3FIe+nzrs+WHv+8O0G9iMSagUBZPkTRIU4ksNQQYlaSPF3G4BJEf3U/i1vrLjMwwSdyZunCF2dLPyo5Qlar9dhiGkFEl+mbeLNmGWcueLxd4wwz66Wq2xtJVZkz4TAxzYIFAB2ovCVuz29mW8YZh4UoNWci7e5AsE4MXtYf0MibV+ENZQwcZpnQi1KL4r54DeCGGCYYfm6H9QcAK48zzr7IRaQngSU0Rq7G0gaak44IR7EXvz+AeL8mSAjh/rj5o3Nfq2U4Caed3DpgQMW0gX2sM480l/PcuexLBnfOTDxNLA4p6weetak9itT3mRPmUpj9H"
  startup_script = <<EOF
sudo apt-get update -y
EOF
}
