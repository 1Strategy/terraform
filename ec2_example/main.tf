
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
  source = "github.com/1Strategy/terraform//modules/"
  key_name = "ragraves_key"
  startup_script = <<EOF
sudo yum update -y \
sudo yum install -y httpd24 php56 mysql55-server php56-mysqlnd \
sudo service httpd start \
sudo chkconfig httpd on \
sudo groupadd www \
sudo usermod -a -G www ec2-user \
sudo chown -R root:www /var/www \
sudo chmod 2775 /var/www \
sudo find /var/www -type d -exec chmod 2775 {} + \
sudo find /var/www -type f -exec chmod 0664 {} + \
sudo su `echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php'`
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
