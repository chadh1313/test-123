#####################################################################
##
##      Created 10/2/18 by ucdpadmin. for test-terraform-project
##
#####################################################################

variable "vm-1_ami" {
  type = "string"
  description = "AMI for VM 1"
  default = "ami-759bc50a"
}

variable "vm-1_aws_instance_type" {
  type = "string"
  description = "Generated"
  default = "t2.medium"
}

variable "availability_zone" {
  type = "string"
  description = "Generated"
  default = "us-east-1a"
}

variable "vm-1_name" {
  type = "string"
  description = "Generated"
  default = "vm1"
}

variable "aws_key_pair_name" {
  type = "string"
  description = "Generated"
  default = "demo-key-abc"
}

variable "vm-2_name" {
  type = "string"
  default = "vm2"
  description = "Generated"
}

variable "network_name_prefix" {
  type = "string"
  description = "Generated"
  default = "vpc1"
}
