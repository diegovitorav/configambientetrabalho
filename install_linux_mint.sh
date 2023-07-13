#!/usr/bin/env bash

# Update the package list
sudo apt update

sudo apt install software-properties-common apt-transport-https wget ca-certificates curl gnupg -y

# Instalação do Docker Community Edition
echo "Docker Install Beginning..."
echo "Uninstall old versions"
sudo apt-get remove docker docker.io containerd runc
sudo apt-get update -y

####################### Add the Docker Configuration #################

#Adicione a chave GPG oficial do Docker:
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Use o seguinte comando para configurar o repositório:
echo deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu focal stable | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update -y

#Instale o Docker Engine, o containerd e o Docker Compose.
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo docker --version
# sudo systemctl enable docker
# sudo systemctl status docker

# Adicionando usuário ao grupo docker
sudo usermod -aG docker $USER

####################### Add the Git Repository #################
sudo add-apt-repository ppa:git-core/ppa
####################### Add the Git Repository #################

####################### Add the Visual Studio Code repository
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg

echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
#######################

####################### Add the Google Chrome repository #################
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' 

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
#################################################

sudo apt update


# Install the packages
sudo apt install code curl git firefox google-chrome-stable tar zip tilix python3-pip vlc
