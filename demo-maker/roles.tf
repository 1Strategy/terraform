// ################################################################################
// # Instance Role
// ################################################################################

// resource "aws_iam_instance_profile" "ecs_instance_profile" {
//     name  = "${var.demo_name}_instance_profile"
//     role = "${aws_iam_role.instance_role.name}"
// }

// resource "aws_iam_role" "instance_role" {
//     name = "${var.demo_name}_instance_role"
//     path = "/"
    
//     assume_role_policy = <<EOF
// {
//   "Version": "2008-10-17",
//   "Statement": [
//     {
//       "Sid": "",
//       "Effect": "Allow",
//       "Principal": {
//         "Service": "ec2.amazonaws.com"
//       },
//       "Action": "STS:AssumeRole"
//     }
//   ]
// }
// EOF
// }

// resource "aws_iam_role_policy" "instance_role_policy" {
//   name = "${var.demo_name}_instance_role_policy"
//   role = "${aws_iam_role.instance_role.name}"

//   policy = <<EOF
// {
//   "Version": "2012-10-17",
//   "Statement": [
//     {
//       "Effect": "Allow",
//       "Action": [
//           "ECR:BatchCheckLayerAvailability",
//           "ECR:BatchGetImage",
//           "ECR:GetAuthorizationToken",
//           "ecr:GetDownloadUrlForLayer",
//           "ecs:CreateCluster",
//           "ecs:DeregisterContainerInstance",
//           "ecs:DiscoverPollEndpoint",
//           "ecs:Poll",
//           "ecs:RegisterContainerInstance",
//           "ecs:StartTelemetrySession",
//           "ecs:Submit*",
//           "ecs:UpdateContainerInstancesState",
//           "logs:CreateLogStream",
//           "logs:PutLogEvents"
//       ],
//       "Resource": "*"
//     }
//   ]
// }
// EOF
// }

// ################################################################################
// # Service Role
// ################################################################################

// resource "aws_iam_role" "service_role" {
//   name = "${var.demo_name}_service_role"

//   assume_role_policy = <<EOF
// {
//   "Version": "2008-10-17",
//   "Statement": [
//     {
//       "Sid": "",
//       "Effect": "Allow",
//       "Principal": {
//         "Service": "ecs.amazonaws.com"
//       },
//       "Action": "STS:AssumeRole"
//     }
//   ]
// }
// EOF
// }

// resource "aws_iam_role_policy" "service_policy" {
//   name = "${var.demo_name}_service_policy"
//   role = "${aws_iam_role.service_role.name}"

//   policy = <<EOF
// {
//   "Version": "2012-10-17",
//   "Statement": [
//     {
//       "Effect": "Allow",
//       "Action": [
//         "EC2:AuthorizeSecurityGroupIngress",
//         "EC2:Describe*",
//         "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
//         "elasticloadbalancing:DeregisterTargets",
//         "elasticloadbalancing:Describe*",
//         "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
//         "elasticloadbalancing:RegisterTargets"
//       ],
//       "Resource": "*"
//     }
//   ]
// }
// EOF
// }

resource "aws_iam_role" "instance_role" {
    name = "test_instance_role"
    path = "/"

    assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "STS:AssumeRole"
    }
  ]
}
EOF
}

// ################################################################################
// # Task Role
// ################################################################################