VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "opscode_ubuntu-14.04"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"

  config.vm.define 'playground' do |node|
    node.vm.network "private_network", ip: "192.168.77.22"
    config.vm.network "forwarded_port", guest: 80,   host: 18080
    config.vm.network "forwarded_port", guest: 8083, host: 18083
    config.vm.network "forwarded_port", guest: 8086, host: 18086
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/site.yml"
    ansible.limit = 'all'
  end
end
