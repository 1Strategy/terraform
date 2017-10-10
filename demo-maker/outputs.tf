################################################################################
# OUTPUTS
################################################################################

// output "repository-name" {
//   value = "${aws_ecr_repository.test-repo.name}"
// }

// output "repository-arn" {
//   value = "${aws_ecr_repository.test-repo.arn}"
// }

// output "repository-url" {
//   value = "${aws_ecr_repository.test-repo.repository_url}"
// }

output "alb_dns_name" {
  value = "${aws_alb.load_balancer.dns_name}"
}

output "subnets" {
    value = "${aws_subnet.subnets.*.id}"
}

output "alb_security_group" {
    value = "${aws_security_group.alb.id}"
}

output "ecs_security_group" {
    value = "${aws_security_group.ecs.id}"
}

output "vpc_id" {
    value = "${aws_vpc.demo_vpc.id}"
}

output "Demo_Type:" {
    value = "${var.demo}"
}