Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/mnt/vagrant"

  config.vm.provider :virtualbox do |v, override|
     v.gui = false
     v.customize ["modifyvm", :id, "--ioapic", "on"]
     v.customize ["modifyvm", :id, "--rtcuseutc", "on"]
   end
  end
end
