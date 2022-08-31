vm_name             = "fedora36-silverblue"
version_description = <<-EOF
Fedora 36 Silverblue

https://silverblue.fedoraproject.org/

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version   = "36.1.5"
iso_checksum = "sha256:c8bac5756017c08135f7ff1be346584eba72e8c74e2842e7e1fc89dd26222dbe"
iso_url      = "https://dl.fedoraproject.org/pub/fedora/linux/releases/36/Silverblue/x86_64/iso/Fedora-Silverblue-ostree-x86_64-36-1.5.iso"

kickstart                = "ks-fedora36-silverblue.cfg"
ostree_remote            = "https://ostree.fedoraproject.org"
ostree_remote_name       = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key           = "/etc/pki/rpm-gpg/"
crypto_policy            = "DEFAULT:SHA1"
vagrantfile_template     = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target           = "graphical.target"
iso_bootloader           = "syslinux"
