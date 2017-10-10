################################################################################
# Application Load Balancer Security Group
################################################################################

resource "aws_security_group" "alb" {
    description = "ALB security group for ${var.demo_name}"
    name        = "${var.demo_name}_sg_alb"
    vpc_id      = "${aws_vpc.demo_vpc.id}"

    tags {
        Name = "1S ECS Demo ALB Security Group"
    }
}

# Allow All HTTP traffic
resource "aws_security_group_rule" "alb_ingress_rule" {
     type              = "ingress"
     from_port         = 80
     to_port           = 80
     protocol          = "tcp"
     cidr_blocks       = ["0.0.0.0/0"]
     security_group_id = "${aws_security_group.alb.id}"
}

# Allow All outbound traffic
resource "aws_security_group_rule" "alb_egress_rule" {
     type              = "egress"
     from_port         = 0
     to_port           = 0
     protocol          = "-1"
     cidr_blocks       = ["0.0.0.0/0"]
     security_group_id = "${aws_security_group.alb.id}"
}

# Allow All ECS traffic
resource "aws_security_group_rule" "allow_ecs_traffic" {
    # this rule applies to the ALB security group
    security_group_id = "${aws_security_group.alb.id}"

    type                     = "ingress"
    from_port                = 0
    to_port                  = 0
    protocol                 = "-1"
    source_security_group_id = "${aws_security_group.ecs.id}"
}

################################################################################
# EC2 Container Service Security Group
################################################################################

resource "aws_security_group" "ecs" {
  description = "Allows ingress from the app ALB"
  name        = "${var.demo_name}_sg_ecs"
  vpc_id      = "${aws_vpc.demo_vpc.id}"

  tags {
      Name = "1S ECS Demo ECS Security Group"
  }
}

# Allow all outbound traffic
resource "aws_security_group_rule" "ecs_egress_rule" {
     type              = "egress"
     from_port         = 0
     to_port           = 0
     protocol          = "-1"
     cidr_blocks       = ["0.0.0.0/0"]
     security_group_id = "${aws_security_group.ecs.id}"
}

# Allow all ALB traffic
resource "aws_security_group_rule" "allow_alb_traffic" {
    # this rule applies to the ECS security group
    security_group_id =  "${aws_security_group.ecs.id}"

    type                     = "ingress"
    from_port                = 0
    to_port                  = 0
    protocol                 = "-1"
    source_security_group_id = "${aws_security_group.alb.id}"
}