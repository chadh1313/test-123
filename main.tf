#####################################################################
##
##      Created 10/2/18 by ucdpadmin. for test-terraform-project
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

provider "aws" {
  version = "~> 1.8"
}

resource "aws_instance" "vm-1" {
  ami = "${var.vm-1_ami}"
  key_name = "${aws_key_pair.auth.id}"
  instance_type = "${var.vm-1_aws_instance_type}"
  availability_zone = "${var.availability_zone}"
  subnet_id  = "${aws_subnet.subnet.id}"
  tags {
    Name = "${var.vm-1_name}"
  }
}

resource "aws_instance" "vm-2" {
  ami = "${var.vm-1_ami}"
  key_name = "${aws_key_pair.auth.id}"
  instance_type = "${var.vm-1_aws_instance_type}"
  availability_zone = "${var.availability_zone}"
  subnet_id  = "${aws_subnet.subnet.id}"
  tags {
    Name = "${var.vm-2_name}"
  }
}

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "aws_key_pair" "auth" {
    key_name = "${var.aws_key_pair_name}"
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}

resource "aws_vpc" "vpc-1" {
  cidr_block           = "172.88.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name = "${var.network_name_prefix}"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = "${aws_vpc.vpc-1.id}"
  cidr_block = "172.88.16.0/20"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "Main"
  }
}
