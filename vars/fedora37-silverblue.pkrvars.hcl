vm_name             = "fedora37-silverblue"
version_description = <<-EOF
Fedora 37 Silverblue

https://silverblue.fedoraproject.org/

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version   = "37.0.20220831"
iso_checksum = "sha256:0d27e97f85b7b42f7f56890806b22710f7cd6d6fad8d16e6dc8a653311c6267c"
iso_url      = "https://dl.fedoraproject.org/pub/fedora/linux/development/37/Silverblue/x86_64/iso/Fedora-Silverblue-ostree-x86_64-37-20220831.n.0.iso"

kickstart                = "ks-fedora37-silverblue.cfg"
ostree_remote            = "https://ostree.fedoraproject.org"
ostree_remote_name       = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key           = "/etc/pki/rpm-gpg/"
crypto_policy            = "DEFAULT:SHA1"
vagrantfile_template     = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target           = "graphical.target"
iso_bootloader           = "grub2"
