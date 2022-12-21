#!/usr/bin/env bash

printf "\n\nRemoving old docker installations"

sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

printf "\n\nSet up the repository"

sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

printf "\n\nInstalling Docker Engine and other Docker Plugins"

sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin

printf "\n\nStarting docker Service"

sudo systemctl start docker

printf "\n\nEnabling docker Service to always run at boot"

sudo systemctl enable docker

printf "\n\nAssigning Current User to docker Group"

sudo usermod -aG docker $USER
