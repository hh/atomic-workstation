vm_name             = "fedora35-silverblue"
version_description = "Fedora 35 Silverblue\n\nhttps://silverblue.fedoraproject.org/\n\nPacker config: https://github.com/fkrull/atomic-workstation"

os_version   = "35.1.2"
iso_checksum = "sha256:afa1df312ce1668b12459d4ec8228d9c6e0977e4dcac3a3d38a8baf7e956effc"
iso_url      = "https://dl.fedoraproject.org/pub/fedora/linux/releases/35/Silverblue/x86_64/iso/Fedora-Silverblue-ostree-x86_64-35-1.2.iso"

kickstart                = "ks-fedora35-silverblue.cfg"
ostree_remote            = "https://ostree.fedoraproject.org"
ostree_remote_name       = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key           = "/etc/pki/rpm-gpg/"
crypto_policy            = "DEFAULT:SHA1"
vagrantfile_template     = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target           = "graphical.target"
iso_bootloader           = "syslinux"
