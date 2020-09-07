Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/mnt/vagrant"

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

  ["vmware_fusion", "vmware_workstation"].each do |provider|
    config.vm.provider provider do |v, override|
      v.gui = true
      v.vmx["ethernet0.virtualDev"] = "vmxnet3"
      v.vmx["RemoteDisplay.vnc.enabled"] = "false"
      v.vmx["RemoteDisplay.vnc.port"] = "5900"
      v.vmx["scsi0.virtualDev"] = "lsilogic"
      v.vmx["mks.enable3d"] = "TRUE"
    end
  end
end
