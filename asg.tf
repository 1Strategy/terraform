
# placement group
resource "aws_placement_group" "ecs_placement" {
  name     = "${var.demo_name}_placement_group"
  strategy = "cluster"
}

# asg
resource "aws_autoscaling_group" "ecs_asg" {
  availability_zones        = ["${var.azs}"]
  name                      = "${var.demo_name}_asg"
  max_size                  = "${var.asg_max}"
  min_size                  = "${var.asg_min}"
  desired_capacity          = "${var.asg_desired}"
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  placement_group           = "${aws_placement_group.ecs_placement.id}"
  launch_configuration      = "${aws_launch_configuration.launch_config.name}"

  timeouts {
      delete = "15m"
  }

  tag {
    Name = "1S ECS Demo Autoscaling Group"
  }
}