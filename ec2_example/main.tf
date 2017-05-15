
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
  source = "github.com/1Strategy/terraform//modules/"
  # ssh_key = "ragraves_key"
#   startup_script = <<EOF
# yum update -y \
# yum install -y httpd24 php56 mysql55-server php56-mysqlnd \
# service httpd start \
# chkconfig httpd on \
# groupadd www \
# usermod -a -G www ec2-user \
# chown -R root:www /var/www \
# chmod 2775 /var/www \
# find /var/www -type d -exec chmod 2775 {} + \
# find /var/www -type f -exec chmod 0664 {} + \
# echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
# EOF
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
