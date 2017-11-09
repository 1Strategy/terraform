// ################################################################################
// # Task Definition
// ################################################################################

// resource "aws_ecs_task_definition" "task_def" {
//     depends_on = ["aws_alb.load_balancer"]
    
//     family                = "${var.demo_name}_task"
//     container_definitions = <<DEFINITION
// [
//   {
//     "cpu": 0,
//     "essential": true,
//     "image": "${var.docker_image}",
//     "memory": ${var.container_memory},
//     "name": "${var.demo_name}_container",
//     "portMappings": [
//       {
//         "containerPort": ${var.container_port}
//       }
//     ],
//     "environment": [
//       {
//         "name": "AWS_DEFAULT_REGION",
//         "value": "${var.aws_region}"
//       }
//     ]
//   }
// ]
// DEFINITION
// }