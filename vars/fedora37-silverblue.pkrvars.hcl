vm_name             = "fedora37-silverblue"
version_description = <<-EOF
Fedora 37 Silverblue

https://silverblue.fedoraproject.org/

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version   = "37.1.7"
iso_checksum = "sha256:2eb299406b33f518acfb472bc70db3c4724c267dec0731ccca2895ff5b1cb14f"
iso_url      = "https://dl.fedoraproject.org/pub/fedora/linux/releases/37/Silverblue/x86_64/iso/Fedora-Silverblue-ostree-x86_64-37-1.7.iso"

kickstart                = "ks-fedora37-silverblue.cfg"
ostree_remote            = "https://ostree.fedoraproject.org"
ostree_remote_name       = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key           = "/etc/pki/rpm-gpg/"
crypto_policy            = "DEFAULT:SHA1"
vagrantfile_template     = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target           = "graphical.target"
iso_bootloader           = "grub2"
