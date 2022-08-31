vm_name             = "fedora26-atomic-workstation"
version_description = "Fedora 26 Atomic Workstation\n\nhttps://pagure.io/workstation-ostree-configs\n\nPacker config: https://github.com/fkrull/atomic-workstation"

os_version   = "26.1.5"
iso_checksum = "sha256:ada01ed9db4c0ad63613c4d14e1463af7e9ba5eb9e455221a38af10cd77c9b16"
iso_url      = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/26/Workstation/x86_64/iso/Fedora-Workstation-ostree-x86_64-26-1.5.iso"

kickstart            = "ks-fedora26-atomic-workstation.cfg"
ostree_remote_name   = "atomicws"
ostree_remote        = "https://ci.centos.org/artifacts/sig-atomic/atomic-ws/ostree/repo"
vagrantfile_template = "tpl/vagrantfile.silverblue.tpl"
systemd_target       = "graphical.target"
iso_bootloader       = "syslinux"
