################################################################################
# VARIABLES
################################################################################

variable "vpc_cidr_block"{
    description = "VPC CIDR"
    default = "10.25.0.0/16"
}

variable "class" {
    default = "Big Data"
}

variable "azs"{
    default = ["us-west-2a", "us-west-2b"]
}

variable "subnet_cidr_blocks" {
    default = ["10.25.0.0/19", "10.25.64.0/19", "10.25.32.0/19",  "10.25.96.0/19"]
}

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
variable "ecs_cluster_name" {
  description = "Name of ECS cluster"
  default     = "syn_tpf_cluster"
}

variable "stack_id" {
  description = "The stack id"
  default = "syn_tpf"
}

variable "vpc_id" {
  description = "VPC A in l3 sox id"
  default = "vpc-15af1773"
}

########################### Task Definition ############################

## ECS Service 
variable "docker_image" {
  description = "location of docker image for our ECS service"
  default     = "059729741532.dkr.ecr.us-east-1.amazonaws.com/syn_tpf_ecr_repo"
}

variable "container_memory" {
  description = "Memory variable for the container."
  default = "2048"
}

variable "container_port" {
  description = "Port number for the container."
## Need to confirm the port number. 
  default = "1234"
}

variable "proxy_string" {
  type = "map"
  default = {
    L1 = "genomics-proxy.ancestryl1.int"
    L2 = "genomics-proxy.ancestryl2.int"
    L3 = "genomics-proxy.ancestryl3.int"
  }
}

variable "aws_region" {
  description = "The AWS region we are using."
  default = "us-east-1"
}

########################### ASG ############################
variable "asg_min" {
  description = "Min numbers of EC2s in ASG"
  default     = {
    L1 = "2"
    L2 = "2"
    L3 = "2"
  }
}

variable "asg_max" {
  description = "Max numbers of EC2s in ASG"
  default     = {
    L1 = "2"
    L2 = "2"
    L3 = "2"
  }
}

variable "asg_desired" {
  description = "Desired numbers of EC2s in ASG"
  default     = {
    L1 = "2"
    L2 = "2"
    L3 = "2"
  }
}

variable "alb_capacity" {
  description = ""
  default = "1"
}

variable "friendly_dns" {
  description = "Friendly DNS Name variable"
  default = "thirdpartyfulfillment"
  }

########################### Launch Config ############################

variable "ami_image_id" {
  description = "Image ID for the AMI"
  default = "ami-b76070cc"
  }

variable "instance_type" {
  description = "Instance size"
  default = "m4.large"
  }

########################### Security Groups ############################
variable "apps_vpc_cidr" {
  type = "map"
  default = {
    L1 = "10.0.0.0/8"
    L2 = "10.0.0.0/8"
    L3 = "10.0.0.0/8"
    }
  }