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

# ALB Listener
resource "aws_alb_listener" "front_end" {
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
    depends_on = ["aws_alb.load_balancer"]

  name     = "${replace("${var.demo_name}", "_", "-")}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.demo_vpc.id}"
}

// # Initial ECS instance
// resource "aws_instance" "initial" {
//   ami = "${var.ami_image_id}"
//   instance_type = "${var.instance_type}"
//   associate_public_ip_address = false
//   iam_instance_profile = "${aws_iam_instance_profile.ecs_instance_profile.name}"
//   subnet_id = "${aws_subnet.subnets.2.id}"
//   vpc_security_group_ids = ["${aws_security_group.ecs.id}"]
// }

// # Attach EC2 to Target Group
// resource "aws_alb_target_group_attachment" "attach_initial" {
//   target_group_arn = "${aws_alb_target_group.ecs_targets.arn}"
//   target_id        = "${aws_instance.initial.id}"
//   port             = 80
// }
