# Application Load Balancer Security Group
resource "aws_security_group" "alb" {
  description = "ALB security group for ${var.demo_name}"
  name        = "${var.demo_name}_sg_alb"
  vpc_id      = "${aws_vpc.vpc.id}"

  # Allow HTTPS from internet
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP from internet
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

//   ingress {
//     from_port = 0
//     to_port = 0
//     protocol = "tcp"
//     security_groups = ["${aws_security_group.ecs.id}"]
//   }

  tags {
      Name = "1S ECS Demo ALB Security Group"
  }
}

# EC2 Container Service Security Group
resource "aws_security_group" "ecs" {
  description = "Allows ingress from the app ALB"
  name        = "${var.demo_name}_sg_ecs"
  vpc_id      = "${aws_vpc.vpc.id}"

  # Allow inbound traffic only from ALB Security Group
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["${aws_security_group.alb.id}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
      Name = "1S ECS Demo ECS Security Group"
  }
}