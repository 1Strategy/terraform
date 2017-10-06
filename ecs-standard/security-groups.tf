/*data "aws_security_group" "subscriptions_default_sg" {
  filter {
    name = "group-name"
    values = ["defaultSubscriptionsSG"]
  }
}
*/
resource "aws_security_group" "syn_tpf_sg_alb" {
  name = "${var.stack_id}_sg_alb"
  description = "ALB security group for ${var.stack_id}"
  
  ingress {
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["10.0.0.0/8"]
  }
  
  tags {
    "Owner" = "Subscriptions"
    "StackId" = "${var.stack_id}"
  }
  
  vpc_id = "${data.terraform_remote_state.global.default_vpc_id}"
}

resource "aws_security_group" "syn_tpf_sg_ecs" {
  name = "${var.stack_id}_sg_ecs"
  description = "Allows ingress from the app ALB"

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    security_groups = ["${aws_security_group.syn_tpf_sg_alb.id}"]
  }

  # Allows access to the apps VPC
  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${var.apps_vpc_cidr["${data.terraform_remote_state.global.aws_environment}"]}"]
  }

  tags {
    "Owner" = "Subscriptions"
    "StackId" = "${var.stack_id}"
  }

  vpc_id = "${data.terraform_remote_state.global.default_vpc_id}"
}