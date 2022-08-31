vm_name             = "fedora37-kinoite"
version_description = <<-EOF
Fedora 37 Kinoite

https://kinoite.fedoraproject.org/

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version   = "37.0.20220831"
iso_checksum = "sha256:f6575eea0df118bff4b9b6b15815f91c2b4ff1407eb6655c337831e6524c584b"
iso_url      = "https://dl.fedoraproject.org/pub/fedora/linux/development/37/Kinoite/x86_64/iso/Fedora-Kinoite-ostree-x86_64-37-20220831.n.0.iso"

kickstart                = "ks-fedora37-kinoite.cfg"
ostree_remote            = "https://ostree.fedoraproject.org"
ostree_remote_name       = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key           = "/etc/pki/rpm-gpg/"
crypto_policy            = "DEFAULT:SHA1"
vagrantfile_template     = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target           = "graphical.target"
iso_bootloader           = "grub2"
