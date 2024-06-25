packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "AWS_ACCESS_KEY_ID" {
  type    = string
  default = "${env("AWS_ACCESS_KEY_ID")}"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type    = string
  default = "${env("AWS_SECRET_ACCESS_KEY")}"
}

variable "AWS_DEFAULT_REGION" {
  type    = string
  default = "${env("AWS_DEFAULT_REGION")}"
}

variable "ami_username" {
  type    = string
  default = "ubuntu"
}

variable "tag" {
  type    = string
  default = "${env("TAG")}"
}

data "amazon-ami" "selected" {
  filters = {
    virtualization-type = "hvm"
    name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
    root-device-type    = "ebs"
  }
  owners      = ["099720109477"]
  most_recent = true
}

source "amazon-ebs" "selected" {
  access_key       = "${var.AWS_ACCESS_KEY_ID}"
  ami_description  = "Ubuntu 22.04 Nat Gateway with Cloudflared in Docker"
  ami_name         = "ubuntu/images/ubuntu-jammy-22.04-amd64/cloudflared-nat-${var.tag}"
  communicator     = "ssh"
  force_deregister = "true"
  instance_type    = "t3.small"
  region           = "${var.AWS_DEFAULT_REGION}"
  secret_key       = "${var.AWS_SECRET_ACCESS_KEY}"
  source_ami       = "${data.amazon-ami.selected.id}"
  ssh_username     = "${var.ami_username}"

  tags = {
    Name = "ubuntu/images/ubuntu-jammy-22.04-amd64/cloudflared-nat-${var.tag}"
  }
}

build {
  sources = ["source.amazon-ebs.selected"]

  provisioner "shell" {
    script       = "user_data.sh"
    pause_before = "10s"
    timeout      = "10s"
  }

  provisioner "file" {
    source      = "files/cloudflared/docker-compose.yml"
    destination = "/home/ubuntu/cloudflared/docker-compose.yml" # Creates path user_data.sh
  }

}
