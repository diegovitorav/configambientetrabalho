NODE_SERVER_COUNT = 1
# IMAGE =  "ubuntu/jammy64"
IMAGE =  "ubuntu/jammy64"
VAGRANTFILE_API_VERSION = "2"
VM_HOSTNAME = "vm01"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define VM_HOSTNAME do |nodeServer|
    nodeServer.vm.box = IMAGE
    nodeServer.vm.hostname = VM_HOSTNAME
    nodeServer.vm.network "private_network", ip: "192.168.56.10", type: "static", bridge: "eth1"
    # nodeServer.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1",  type: "static", bridge: "eth1"

    # nodeServer.vm.synced_folder "data/", "/mnt/vagrant", type: "virtualbox"

    nodeServer.vm.provision "shell", privileged: true,  path: "install.sh"

    nodeServer.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "2048"
    end
  end
end


## Referências para estudo
# https://github.com/pagewiser/gitlab-runner-docker-vagrant.git
# https://gist.github.com/cjtallman/b526d8c7d8b910ba4fd41eb51cd5405b
# https://imasters.com.br/devsecops/gitlab-ci-seu-proprio-runner-privado-com-docker-compose
# https://github.com/infra-ci-book/gitlab-vagrant-ansible
