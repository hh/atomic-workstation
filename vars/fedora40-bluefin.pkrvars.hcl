vm_name             = "fedora40-bluefin"
version_description = <<-EOF
Fedora :0 Silverblue

https://projectbluefin.io

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version   = "40.20241014.0"
iso_checksum = "7a4b460e7e7b0a06fd1e713fed8fb610b2f1fead3ff36b1e585f0db221e34b01"
iso_url      = "deploy.iso"

kickstart                = "ks-fedora40-bluefin.cfg"
ostree_remote            = "https://ostree.fedoraproject.org"
ostree_remote_name       = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key           = "/etc/pki/rpm-gpg/"
crypto_policy            = "DEFAULT:SHA1"
vagrantfile_template     = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target           = "graphical.target"
iso_bootloader           = "grub2"
virtualbox_firmware      = "efi"
