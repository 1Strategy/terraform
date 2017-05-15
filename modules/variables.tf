################################################################################
# VARIABLES
################################################################################

variable "startup_script" {
  description = "A script to be run when the instance is spun up; the User Data."
}

variable "ssh_key" {
  description = "The key pair that will be used to ssh into this instance."
}

################################################################################
# OUTPUTS
################################################################################

# output "ec2_instance_id" {
#   value = "${aws_instance.ec2_instance.id}"
# }
