VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.proxy.http = "http://proxy.ullink.lan:9876"
  config.proxy.https = "http://proxy.ullink.lan:9876"

  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, host: 8080, guest: 8080
  config.vm.network :forwarded_port, host: 29418, guest: 29418
  config.vm.provision "shell", path: "bootstrap.sh", privileged: false
  config.vm.box_check_update = false
end
