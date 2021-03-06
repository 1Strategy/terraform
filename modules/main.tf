# EC2 instance
resource "aws_instance" "test_instance" {
  ami           = "ami-4836a428"
  instance_type = "t2.micro"
  user_data     = "${file("${var.startup_script}")}"
  key_name      = "${var.ssh_key}"

  tags {
    Name = "${var.name}"
  }
}
