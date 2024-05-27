Vagrant.configure("2") do |config|
    config.vm.define "master" do |master|
      master.vm.box = "ubuntu/bionic64"
      master.vm.network "private_network", type: "dhcp"
      master.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
      end
    end
  
    config.vm.define "agent" do |agent|
      agent.vm.box = "ubuntu/bionic64"
      agent.vm.network "private_network", type: "dhcp"
      agent.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
      end
    end
  end
  