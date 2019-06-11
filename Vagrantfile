Vagrant.configure("2") do |config|

  config.vm.box = "offensive-security/kali-linux-light"
  config.vm.network "public_network"
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|

    # Change the virtual machine name
    vb.name = "Kali CTF"

    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = "4096"

    # Customize the amount of cpus on the VM:
    vb.cpus = 4

    # Set the video memory to 128Mb:
    vb.customize ["modifyvm", :id, "--vram", "128"]

    # Disable 3D acceleration:
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]

    # Disable audio
    vb.customize ["modifyvm", :id, "--audio", "none"]

    # Integration with desktop
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
  end


  config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "Playbook.yml"
  end

end
