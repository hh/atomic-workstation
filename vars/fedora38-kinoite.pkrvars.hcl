vm_name             = "fedora38-kinoite"
version_description = <<-EOF
Fedora 38 Kinoite

https://kinoite.fedoraproject.org/

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version   = "38.0.20230318"
iso_checksum = "sha256:f0b127b1149164cd06075cc40f468281838030b6de363ecd5b83fc1be4cd978a"
iso_url      = "https://dl.fedoraproject.org/pub/fedora/linux/development/38/Kinoite/x86_64/iso/Fedora-Kinoite-ostree-x86_64-38-20230318.n.0.iso"

kickstart                = "ks-fedora38-kinoite.cfg"
ostree_remote            = "https://ostree.fedoraproject.org"
ostree_remote_name       = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key           = "/etc/pki/rpm-gpg/"
crypto_policy            = "DEFAULT:SHA1"
vagrantfile_template     = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target           = "graphical.target"
iso_bootloader           = "grub2"
