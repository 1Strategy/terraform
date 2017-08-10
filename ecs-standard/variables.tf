################################################################################
# VARIABLES
################################################################################

variable "L3-tools-role" {
  description = "In the L3-Tools account, role from the Team Jenkins server EC2 instance"
}

variable "aws-account" {
  type = "map"
  default = {
    L1 = "############"
    L2 = "############"
    L3 = "############"
  }
}

variable "ecs-task-role" {
  description = "The name of the ECS task role(s) in L3/L2/L1 that need to retrieve images from ECR Repository in L1"
}

variable "ecr-repo-name" {
    description = "ECR Repository Name"
}
