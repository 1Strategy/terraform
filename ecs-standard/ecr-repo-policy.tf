// data "aws_iam_policy_document" "ecr_policy" {
//   statement {
//     actions = [
//         "ecr:GetDownloadUrlForLayer",
//         "ecr:BatchGetImage",
//         "ecr:BatchCheckLayerAvailability",
//         "ecr:PutImage",
//         "ecr:InitiateLayerUpload",
//         "ecr:UploadLayerPart",
//         "ecr:CompleteLayerUpload",
//         "ecr:DescribeRepositories",
//         "ecr:GetRepositoryPolicy",
//         "ecr:ListImages",
//         "ecr:DeleteRepository",
//         "ecr:BatchDeleteImage",
//         "ecr:GetAuthorizationToken",
//         "ecr:SetRepositoryPolicy",
//         "ecr:DeleteRepositoryPolicy"
//     ]

//     principals {
//       type        = "AWS"
//       identifiers = [
//         "*"
//       ]
//     }

//     condition {
//       test     = "ArnEquals"
//       variable = "aws:SourceArn"
//       values = [
//         "arn:aws:iam::${var.aws-account["L1"]}:role/${var.ecs-task-role}",
//         "arn:aws:iam::${var.aws-account["L2"]}:role/${var.ecs-task-role}",
//         "arn:aws:iam::${var.aws-account["L3"]}:role/${var.ecs-task-role}"
//       ]
//     }

//   }
// }
