Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--memory", "16384"]
    vb.customize ["modifyvm", :id, "--cpus", "8"]
    vb.customize ['modifyvm', :id, '--nested-hw-virt', "on"]
  end
  
  config.vm.define "openshift", autostart: false do |srv|
    srv.vm.box = "generic/ubuntu2204"
    #srv.vm.box = "generic/centos8"
    srv.vm.hostname = "openshift"
    srv.vm.synced_folder ".", "/shared"
    srv.vm.network "private_network", :ip => "192.168.56.99"
    srv.vm.provision :shell, path: "provision/bootstrap.sh"
    srv.vm.provision :shell, path: "provision/startup.sh", run: 'always'
  end

end
