### ECS Task Definitions
/*
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
            "awslogs-group": "${aws_cloudwatch_log_group.alb.name}",
            "awslogs-region": "${var.aws_region}"
        }
    }
*/


# Create Task Definition for service
resource "aws_ecs_task_definition" "syn_tpf_task_def" {
  family                = "${var.stack_id}_task"
  # We need to define the role
  task_role_arn         = "${aws_iam_role.syn_tpf_task_role.arn}"
  # Docker settings
  ## We need to find a way to dynamically detemine the image version number ...
  container_definitions = <<DEFINITION
[
  {
    "cpu": 0,
    "essential": true,
    "image": "${var.docker_image}:latest",
    "memory": ${var.container_memory},
    "name": "${var.stack_id}_container",
    "portMappings": [
      {
        "containerPort": ${var.container_port},
        "hostPort": 0
      }
    ],
    "environment": [
      {
        "name": "AWS_DEFAULT_REGION",
        "value": "${var.aws_region}"
      }
    ]
  }
]
DEFINITION
}