Vagrant.configure("2") do |config|

  config.vm.box = "kalilinux/rolling"
  config.vm.network "public_network", type: "dhcp", bridge: "en0: Wi-Fi (Wireless)"

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

    # Set graphics card type:
    # vb.customize ["modifyvm", :id, "--graphicscontroller", "vboxsvga"]

    # Set the video memory to 128Mb:
    # vb.customize ["modifyvm", :id, "--vram", "128"]

    # Enable 3D acceleration:
    # vb.customize ["modifyvm", :id, "--accelerate3d", "on"]

    # Integration with desktop
    # vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    # vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "Playbook.yml"
  end

end
