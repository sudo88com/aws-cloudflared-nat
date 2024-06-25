resource "aws_security_group" "selected" {
  name        = "default-${var.CI_ENVIRONMENT_NAME}-nat-sgrp"
  description = "default-${var.CI_ENVIRONMENT_NAME}-nat-sgrp"
  vpc_id      = data.aws_vpc.selected.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name"        = "default-${var.CI_ENVIRONMENT_NAME}-nat-sgrp"
    "Terraform"   = "True"
    "Project"     = "default-nat"
    "Environment" = "${var.CI_ENVIRONMENT_NAME}"
  }
}

resource "aws_eip" "selected" {
  tags = {
    Name = "default-${var.CI_ENVIRONMENT_NAME}-eip-nat-ec2"
  }
}

resource "aws_eip_association" "selected" {
  instance_id   = module.aws_ec2.id
  allocation_id = aws_eip.selected.id
}

data "aws_route_table" "selected" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "tag:Name"
    values = ["default-${var.CI_ENVIRONMENT_NAME}-private"]
  }
}

resource "aws_route" "selected" {
  route_table_id         = data.aws_route_table.selected.id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id   = module.aws_ec2.primary_network_interface_id
}

data "aws_region" "current" {}

data "aws_vpc" "selected" {
  tags = {
    Name = "default-${var.CI_ENVIRONMENT_NAME}"
  }
}

data "aws_subnets" "public_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "tag:Name"
    values = ["*-public-*1a"]
  }
}

data "aws_subnets" "public_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "tag:Name"
    values = ["*-public-*1b"]
  }
}

data "aws_subnets" "public_c" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "tag:Name"
    values = ["*-public-*1c"]
  }
}

data "aws_subnets" "private_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "tag:Name"
    values = ["*-private-*1a"]
  }
}

data "aws_subnets" "private_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "tag:Name"
    values = ["*-private-*1b"]
  }
}

data "aws_subnets" "private_c" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "tag:Name"
    values = ["*-private-*1c"]
  }
}

data "aws_ami" "selected" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}
