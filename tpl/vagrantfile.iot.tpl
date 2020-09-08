Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/mnt/vagrant"

  config.vm.provider :virtualbox do |v, override|
     v.gui = false
     v.customize ["modifyvm", :id, "--ioapic", "on"]
     v.customize ["modifyvm", :id, "--rtcuseutc", "on"]
   end

  ["vmware_fusion", "vmware_workstation"].each do |provider|
    config.vm.provider provider do |v, override|
      v.gui = false
      v.vmx["ethernet0.virtualDev"] = "vmxnet3"
      v.vmx["RemoteDisplay.vnc.enabled"] = "false"
      v.vmx["RemoteDisplay.vnc.port"] = "5900"
      v.vmx["scsi0.virtualDev"] = "lsilogic"
      v.vmx["mks.enable3d"] = "TRUE"
    end
  end
end
