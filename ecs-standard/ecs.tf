# Establish provider
provider "aws" {
  region = "us-west-2"
  profile = "default"
  # assume_role {
  #   role_arn = "arn:aws:iam::842337631775:role/1S-Admins"
  # }
}

# Create ECS Cluster
resource "aws_ecs_cluster" "syn_tpf_ecs_cluster" {
  name = "${var.ecs_cluster_name}"
}

# Create ECS service
resource "aws_ecs_service" "syn_tpf_ecs_service" {

  name            = "${var.stack_id}_service"
  cluster         = "${aws_ecs_cluster.syn_tpf_ecs_cluster.id}"
  task_definition = "${aws_ecs_task_definition.syn_tpf_task_def.arn}"
  desired_count   = 2
  iam_role        = "${aws_iam_role.syn_tpf_service_role.arn}"

  # Spreads tasks evenly across AZs
  placement_strategy = {
    field = "attribute:ecs.availability_zone",
    type = "spread"
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.syn_tpf_target_group.arn}"
    container_name   = "${var.stack_id}_container"
    container_port   = "${var.container_port}"
  }
}