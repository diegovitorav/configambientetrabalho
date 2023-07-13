#!/usr/bin/env bash

------------------------------------------  INSTALAÇÃO PACOTES BÁSICOS  -----------------------------------------------------------

# Instalação de pacotes básicos
sudo apt-get update -y
sudo apt-get install unzip vim jq apt-transport-https lsb-release ca-certificates curl gnupg -y

# Instalação do VSCODE 
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo apt-get update -y
sudo apt install code -y

-----------------------------------------  INSTALAÇÃO DOCKER  ----------------------------------------------------------------

# Instalação do Docker Community Edition
echo "Docker Install Beginning..."
echo "Uninstall old versions"
sudo apt-get remove docker docker.io containerd runc
sudo apt-get update -y

#Adicione a chave GPG oficial do Docker:
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Use o seguinte comando para configurar o repositório:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y

#Instale o Docker Engine, o containerd e o Docker Compose.
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo docker --version
# sudo systemctl enable docker
# sudo systemctl status docker

# Adicionando usuário ao grupo docker
sudo usermod -aG docker $USER
#Configura usuário para possuir permissões root
#sudo echo "diego   ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

------------------------------------------  vscode  ----------------------------------------------------------------
# Instalação do sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"