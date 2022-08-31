vm_name             = "fedora36-kinoite"
version_description = <<-EOF
Fedora 36 Kinoite

https://kinoite.fedoraproject.org/

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version   = "36.1.5"
iso_checksum = "sha256:9a7e538961ae22c0f85a88fed240dbdc8b82452340fe8a83d66c0c84c28813e4"
iso_url      = "https://dl.fedoraproject.org/pub/fedora/linux/releases/36/Kinoite/x86_64/iso/Fedora-Kinoite-ostree-x86_64-36-1.5.iso"

kickstart                = "ks-fedora36-kinoite.cfg"
ostree_remote            = "https://ostree.fedoraproject.org"
ostree_remote_name       = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key           = "/etc/pki/rpm-gpg/"
crypto_policy            = "DEFAULT:SHA1"
vagrantfile_template     = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target           = "graphical.target"
iso_bootloader           = "syslinux"
