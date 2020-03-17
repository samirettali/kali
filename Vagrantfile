Vagrant.configure("2") do |config|

  config.vm.box = "kalilinux/rolling"
  config.vm.box_version = "2019.4.0"
  config.vm.box_check_update = false

  config.vm.network "private_network", ip: "10.0.0.2"

  # SMB ports
  config.vm.network "forwarded_port", guest: 135, host: 135
  config.vm.network "forwarded_port", guest: 139, host: 139
  config.vm.network "forwarded_port", guest: 445, host: 445

  # Reverse connection ports
  config.vm.network "forwarded_port", guest: 1337, host: 1337
  config.vm.network "forwarded_port", guest: 1338, host: 1338
  config.vm.network "forwarded_port", guest: 1339, host: 1339

  # SSH settings
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
    # Change the virtual machine name
    vb.name = "CTF"

    # Don't display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = "8192"

    # Customize the amount of cpus on the VM:
    vb.cpus = 8
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "Playbook.yml"
  end

end
