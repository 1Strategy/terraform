
# Establish provider
provider "aws" {
  region  = "us-west-2"
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

# EC2 instance
resource "aws_instance" "test_instance" {
  ami           = "ami-4836a428"
  instance_type = "t2.micro"
  user_data     = "${file("${path.root}/startup.sh")}"
  key_name      = "${var.ssh_key}"

  tags {
    Name   = "My-Terraform-Instance"
    SackID = "Data-Lake"
  }
}