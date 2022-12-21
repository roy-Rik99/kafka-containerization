#!/usr/bin/env bash

printf "Removing old docker installations"

sudo apt-get remove docker docker-engine docker.io containerd runc

printf "Set up the repository"

sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

printf "Installing Docker Engine and "

sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo systemctl start docker

sudo systemctl enable docker

sudo usermod -aG docker $

sudo apt-get remove docker docker-engine docker.io containerd runc





