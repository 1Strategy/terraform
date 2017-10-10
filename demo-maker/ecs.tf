################################################################################
# EC2 Container Service
################################################################################

# Create Cluster
resource "aws_ecs_cluster" "cluster" {
    name = "${var.ecs_cluster_name}"
}

# Create ECS service
resource "aws_ecs_service" "service" {
    depends_on = [
        "aws_autoscaling_group.ecs_asg",
        "aws_alb_target_group.ecs_targets",
        "aws_ecs_task_definition.task_def",
        "aws_iam_instance_profile.ecs_instance_profile"
    ]

    name            = "${var.demo_name}"
    cluster         = "${aws_ecs_cluster.cluster.id}"
    task_definition = "${aws_ecs_task_definition.task_def.arn}"
    desired_count   = 2
    # Service Role for the ECS cluster
    iam_role        = "${aws_iam_role.service_role.arn}"

    # Spread tasks evenly across AZs
    placement_strategy {
      field = "attribute:ecs.availability_zone",
      type  = "spread"
    }

    load_balancer {
      target_group_arn = "${aws_alb_target_group.ecs_targets.arn}"
      container_name   = "${var.demo_name}_container"
      container_port   = "${var.container_port}"
    }
}