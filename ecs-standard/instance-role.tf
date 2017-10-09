# Instance Profile
resource "aws_iam_instance_profile" "ecs_instance_profile" {
    name  = "${var.demo_name}_instance_profile"
    role = "${aws_iam_role.instance_role.name}"
}

# Instance Role w/Trust Relationship
resource "aws_iam_role" "instance_role" {
    name = "${var.demo_name}_instance_role"
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
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Instance Role Policy
resource "aws_iam_role_policy" "instance_role_policy" {
  name = "${var.demo_name}_instance_role_policy"
  role = "${aws_iam_role.instance_role.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:GetAuthorizationToken",
          "ecr:GetDownloadUrlForLayer",
          "ecs:CreateCluster",
          "ecs:DeregisterContainerInstance",
          "ecs:DiscoverPollEndpoint",
          "ecs:Poll",
          "ecs:RegisterContainerInstance",
          "ecs:StartTelemetrySession",
          "ecs:Submit*",
          "ecs:UpdateContainerInstancesState",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}


