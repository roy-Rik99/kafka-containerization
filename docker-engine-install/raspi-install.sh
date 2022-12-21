#!/usr/bin/env bash


#Install using the convenience script

#You can run the script with the DRY_RUN=1 option to learn what steps the script will run when invoked

curl -fsSL https://get.docker.com -o get-docker.sh
#DRY_RUN=1 sudo bash ./get-docker.sh

sudo sh get-docker.sh

#Starting docker service

sudo service docker restart

#Enabling docker service at boot

sudo systemctl enable docker.service docker.socket

sudo usermod -aG docker $USER
