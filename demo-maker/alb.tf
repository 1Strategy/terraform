################################################################################
# Application Load Balancer
################################################################################

resource "aws_alb" "load_balancer" {
  name            = "1s-demo-load-balancer"
  internal        = false
  security_groups = ["${aws_security_group.alb.id}"]
  subnets         = ["${aws_subnet.subnets.*.id}"]

  tags {
    Name = "1S ECS Demo ALB"
  }
}

# HTTP Listener
resource "aws_alb_listener" "front_end" {
    # depends_on = [ecs_service]
  load_balancer_arn = "${aws_alb.load_balancer.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.ecs_targets.arn}"
    type             = "forward"
  }
}

# ECS Target Group
resource "aws_alb_target_group" "ecs_targets" {
  name     = "${replace("${var.demo_name}", "_", "-")}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.demo_vpc.id}"
}