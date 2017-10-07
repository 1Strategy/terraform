# ECS Application Load Balancer
resource "aws_alb" "load_balancer" {
  name            = "1s-demo-load-balancer"
  internal        = false
  security_groups = ["${aws_security_group.alb.id}"]
  subnets         = ["${aws_subnet.subnets.*.id}"]

  tags {
    Name = "1S ECS Demo ALB"
  }
}

# ECS Target Group
resource "aws_alb_target_group" "ecs_targets" {
  name     = "${var.demo_name}_tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.vpc.id}"
}