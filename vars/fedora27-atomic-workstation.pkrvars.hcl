vm_name             = "fedora27-atomic-workstation"
version_description = "Fedora 27 Atomic Workstation\n\nhttps://fedoraproject.org/wiki/Workstation/AtomicWorkstation\n\nPacker config: https://github.com/fkrull/atomic-workstation"

os_version   = "27.1.6"
iso_checksum = "sha256:92372716a0139f833b881f390475fe9eee4fada73aa24a363c7e106dd586235b"
iso_url      = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/27/WorkstationOstree/x86_64/iso/Fedora-WorkstationOstree-ostree-x86_64-27-1.6.iso"

kickstart            = "ks-fedora27-atomic-workstation.cfg"
ostree_remote_name   = "atomicws"
ostree_remote        = "https://dl.fedoraproject.org/ostree/27/"
ostree_gpg_key       = "/etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-27-primary"
vagrantfile_template = "tpl/vagrantfile.silverblue.tpl"
systemd_target       = "graphical.target"
iso_bootloader       = "syslinux"
