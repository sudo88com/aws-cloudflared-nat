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
}

function install_cloudflared() {
    mkdir -p ~/cloudflared
    echo "services:" > ~/cloudflared/docker-compose.yml
    echo "
  cloudflared:
    container_name: cloudflared
    image: cloudflare/cloudflared:latest
    restart: always
    command: tunnel --no-autoupdate run --token "\${CF_CLOUDFLARED_TOKEN}"
    network_mode: "host"
" >> ~/cloudflared/docker-compose.yml
}

function run_cloudflared() {
    cd ~/cloudflared
    docker compose up -d
}

function main() {
    install_nat
    install_docker
    install_cloudflared
    run_cloudflared
}

set -o errexit

main
