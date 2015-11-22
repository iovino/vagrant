boxname   = "vagrant"
hostname  = "vagrant.loc"
ipaddress = "192.168.42.1"

Vagrant.configure("2") do |config|

  config.omnibus.chef_version = :latest

  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = "./vagrant/Berksfile"

  config.vm.provider "virtualbox" do |v|
    v.name   = boxname
    v.memory = 2048
    v.cpus   = 2

    v.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.box      = "ubuntu/trusty64"
  #config.vm.box_url  = ""
  config.vm.hostname = hostname
  config.vm.network :private_network, ip: ipaddress

  config.vm.synced_folder "./", "/var/www", group: "www-data", mount_options: ["dmode=777,fmode=664"]

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./"
    chef.json = {
      'apache' => {
        'docroot_dir' => '/var/www/public'
      },
      'oh_my_zsh' => {
        'login' => 'vagrant',
        'theme' => 'blinks'
      }
    }
    chef.run_list = [
        "recipe[divups::default]",
        "recipe[divups::apache]",
        "recipe[divups::php]",
        "recipe[divups::mysql]",
        "recipe[divups::mailcatcher]",
        "recipe[divups::nodejs]",
        "recipe[divups::oh_my_zsh]",
        "recipe[divups::cleanup]"
    ]
  end
end