################################################################################
# AutoScaling Group
################################################################################

resource "aws_autoscaling_group" "ecs_asg" {
    depends_on = [
        "aws_launch_configuration.launch_config",
        "aws_subnet.subnets",
        "aws_alb.load_balancer"
    ]

    name                      = "${var.demo_name}_asg"
    availability_zones        = ["${var.azs}"]
    max_size                  = "${var.asg_max}"
    min_size                  = "${var.asg_min}"
    desired_capacity          = "${var.asg_desired}"
    health_check_type         = "EC2"
    health_check_grace_period = 300
    force_delete              = true
    launch_configuration      = "${aws_launch_configuration.launch_config.name}"
    vpc_zone_identifier       = ["${aws_subnet.subnets.*.id}"]
    target_group_arns         = ["${aws_alb_target_group.ecs_targets.arn}"]

    tag {
        key                 = "Built By"
        value               = "1S ECS Demo Autoscaling Group"
        key                 = "Name"
        value               = "1S ECS Demo Instance"
        propagate_at_launch = true
    }
}