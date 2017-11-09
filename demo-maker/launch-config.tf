// ################################################################################
// # Launch Configuration
// ################################################################################

// resource "aws_launch_configuration" "launch_config" {
//     name_prefix                 = "${var.demo_name}_launch_config_"
//     key_name                    = "ragraves_key"
//     image_id                    = "${var.ami_image_id}"
//     instance_type               = "${var.instance_type}"
//     iam_instance_profile        = "${aws_iam_instance_profile.ecs_instance_profile.name}"
//     associate_public_ip_address = false
//     security_groups             = ["${aws_security_group.ecs.id}"]

//     lifecycle {
//         create_before_destroy = true
//     }

//     user_data = <<EOF
// #!/bin/bash
// echo ECS_CLUSTER=${var.ecs_cluster_name} >> /etc/ecs/ecs.config
// EOF
// }
