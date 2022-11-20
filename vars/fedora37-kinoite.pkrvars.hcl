vm_name             = "fedora37-kinoite"
version_description = <<-EOF
Fedora 37 Kinoite

https://kinoite.fedoraproject.org/

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version   = "37.1.7"
iso_checksum = "sha256:1225fedd0dca3eafec0c60bac714fae418d6f5f8f42a37818cf903a5e65a15bc"
iso_url      = "https://dl.fedoraproject.org/pub/fedora/linux/releases/37/Kinoite/x86_64/iso/Fedora-Kinoite-ostree-x86_64-37-1.7.iso"

kickstart                = "ks-fedora37-kinoite.cfg"
ostree_remote            = "https://ostree.fedoraproject.org"
ostree_remote_name       = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key           = "/etc/pki/rpm-gpg/"
crypto_policy            = "DEFAULT:SHA1"
vagrantfile_template     = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target           = "graphical.target"
iso_bootloader           = "grub2"
