resource "aws_instance" "test" {
  ami           = "ami-4836a428"
  instance_type = "t2.micro"

  tags {
    Name = "HelloWorld"
  }
}