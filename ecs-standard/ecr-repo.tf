// # Create ECR Repository
// resource "aws_ecr_repository" "repo" {
//   name = "${var.ecr-repo-name}"
// }

// # Create ECR Repository Policy
// resource "aws_ecr_repository_policy" "test-repo-policy" {
//   repository = "${aws_ecr_repository.repo.name}"
//   policy = "${data.aws_iam_policy_document.ecr_policy.json}"
// }
