### ECS Launch Configuration
/*
data "template_file" "user_data_script" {
  template = "${file("${path.module}/user-data-script.sh")}"
  vars {
    ecs_cluster_name   = "${aws_ecs_cluster.syn_tpf_ecs_cluster.name}"
    proxy_string = "${var.proxy_string["${data.terraform_remote_state.global.aws_environment}"]}"
    infosec_twistlock_url = "${var.infosec_twistlock_url["${data.terraform_remote_state.global.aws_environment}"]}"
  }
}
*/

resource "aws_launch_configuration" "test_launch_config" {
  
  name_prefix                 = "1s_test"
  key_name                    = "<make key pair>"
  image_id                    = "${var.ami_image_id}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${aws_iam_instance_profile.syn_tpf_instance_profile.name}"
  # user_data 				  = "${data.template_file.user_data_script.rendered}"
  associate_public_ip_address = false

  # security_groups = ["${aws_security_group.syn_tpf_sg_ecs.id}"]
  
  lifecycle { create_before_destroy = true }
  
}