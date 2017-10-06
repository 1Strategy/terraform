################################################################################
# OUTPUTS
################################################################################

output "repository-name" {
  value = "${aws_ecr_repository.test-repo.name}"
}

output "repository-arn" {
  value = "${aws_ecr_repository.test-repo.arn}"
}

output "repository-url" {
  value = "${aws_ecr_repository.test-repo.repository_url}"
}

output "alb_dns_name" {
  value = "${aws_alb.syn_tpf_alb.dns_name}"
}