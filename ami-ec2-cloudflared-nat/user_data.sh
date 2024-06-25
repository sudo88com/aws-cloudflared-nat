#!/usr/bin/env bash

function install_nat() {
    # Turning on IP Forwarding
    echo "net.ipv4.ip_forward = 1" | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p
    # Making a catchall rule for routing and masking the private IP
    sudo iptables -t nat -A POSTROUTING -o ens5 -s 0.0.0.0/0 -j MASQUERADE
}

function install_docker() {
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    # Add user to docker group
    sudo usermod -aG docker ubuntu
}

function install_cloudflared() {
    sudo -u ubuntu mkdir -p /home/ubuntu/cloudflared
    # docker-compose.yml file is already transferred by Packer
}

function ami_startup() {
    sudo systemctl enable docker
    sudo systemctl stop docker
    sudo systemctl enable ssh
    sudo rm -rf /var/log/*
    sudo rm -rf /tmp/*
    sudo rm -rf /var/tmp/*
}

function main() {
    install_nat
    install_docker
    install_cloudflared
    ami_startup
}

set -o errexit

main
