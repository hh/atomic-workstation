Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/home/vagrant/sync", type: "rsync"

  config.vm.provider :virtualbox do |v, override|
     v.gui = true
     v.customize ["modifyvm", :id, "--vram", "256"]
     v.customize ["setextradata", "global", "GUI/MaxGuestResolution", "any"]
     v.customize ["setextradata", :id, "CustomVideoMode1", "1024x768x32"]
     v.customize ["setextradata", :id, "CustomVideoMode2", "1280x720x32"]
     v.customize ["modifyvm", :id, "--ioapic", "on"]
     v.customize ["modifyvm", :id, "--rtcuseutc", "on"]
     v.customize ["modifyvm", :id, "--accelerate3d", "off"]
     v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
   end
  end
end
