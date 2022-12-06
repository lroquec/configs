# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
   config.vm.define "almalinux" do |hq|
    hq.vm.box = "generic/alma8"
    hq.vm.network "private_network", ip: "192.168.56.3"
    hq.vm.provider "virtualbox" do |vb|
      vb.name = "AlmaLinux"
      vb.cpus = 2
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--nic2", "hostonly", "--hostonlyadapter2", "vboxnet0"]
    end
end
  config.vm.provision "shell", inline: <<-SHELL
  sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config    
  systemctl restart sshd.service
  SHELL
end
