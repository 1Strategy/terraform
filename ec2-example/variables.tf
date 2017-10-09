################################################################################
# VARIABLES
################################################################################

variable "ssh_key" {
  description = "The key pair that will be used to ssh into this instance."
  default = "ragraves_key"
}


################################################################################
# OUTPUTS
################################################################################

# output "ec2_instance_id" {
#   value = "${aws_instance.ec2_instance.id}"
# }