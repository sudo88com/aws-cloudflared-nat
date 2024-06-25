#!/usr/bin/env bash

function configure_cloudflared() {
    echo "CF_CLOUDFLARED_TOKEN=${CF_CLOUDFLARED_TOKEN}" | sudo tee /home/ubuntu/cloudflared/.env
}

function start_cloudflared() {
    sudo usermod -aG docker ubuntu
    sudo -u ubuntu docker compose -f /home/ubuntu/cloudflared/docker-compose.yml up -d
}

set -o errexit

configure_cloudflared
start_cloudflared
