# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "hashicorp/precise64"
    config.vm.network :private_network, ip: "192.168.33.13"

    config.vm.provision :shell, :path => "install.sh"
# an additional bootstrap/provisioning script
#    config.vm.provision :shell, :path => "bootstrap.sh"

# was having ssh troubles, so this helped. eventually, the better solution was to do: vagrant destroy
#    config.ssh.username = "vagrant"
#    config.ssh.password = "vagrant"

    config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
#    config.vm.synced_folder "D:/abid/php/", "/var/www/html"
end
