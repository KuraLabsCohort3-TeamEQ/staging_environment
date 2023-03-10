#!/bin/bash

#Clone Application Repo Onto Newly Created EC2 and Cronjob
export HOME=/home/ubuntu
sudo -- bash -c 'echo "* * * * * root cd /home/ubuntu/staging_environment/ && git pull origin main && sleep 10 && git pull origin main && sleep 10 && git pull origin main && sleep 10 && git pull origin main && sleep 10 && git pull origin main" >> /etc/crontab'
sudo -- bash -c "git clone https://github.com/KuraLabsCohort3-TeamEQ/staging_environment.git && mv staging_environment/ /home/ubuntu/"
sudo -- bash -c "cd /home/ubuntu && git init && git remote add origin https://github.com/KuraLabsCohort3-TeamEQ/staging_environment.git"

#Install Docker 
sudo apt-get update
sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo apt install docker-compose -y 

