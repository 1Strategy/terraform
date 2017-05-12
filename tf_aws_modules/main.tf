
# EC2 instance
resource "aws_instance" "test_instance" {
  ami           = "ami-4836a428"
  instance_type = "t2.micro"
  user_data     = "${var.startup_script}"
  key_name      = "${var.ssh_key}"
  tags {
    Name = "HelloWorld"
  }
}

variable "startup_script" {
  description = "A script to be run when the instance is spun up; the User Data."
}

variable "ssh_key" {
  description = "The key pair that will be used to ssh into this instance."
}
