vm_name             = "fedora38-silverblue"
version_description = <<-EOF
Fedora 38 Silverblue

https://silverblue.fedoraproject.org/

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version   = "38.0.20230318"
iso_checksum = "sha256:88c792f417444bf09b5d073479803c0c35c53a84b744ceaf89608214dc9bca0d"
iso_url      = "https://dl.fedoraproject.org/pub/fedora/linux/development/38/Silverblue/x86_64/iso/Fedora-Silverblue-ostree-x86_64-38-20230318.n.0.iso"

kickstart                = "ks-fedora38-silverblue.cfg"
ostree_remote            = "https://ostree.fedoraproject.org"
ostree_remote_name       = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key           = "/etc/pki/rpm-gpg/"
crypto_policy            = "DEFAULT:SHA1"
vagrantfile_template     = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target           = "graphical.target"
iso_bootloader           = "grub2"
virtualbox_firmware      = "efi"
