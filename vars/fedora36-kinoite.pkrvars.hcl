vm_name = "fedora36-kinoite"
version_description = <<-EOF
Fedora 36 Kinoite

https://kinoite.fedoraproject.org/

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version = "36.0.20220322"
iso_checksum = "sha256:2fde441d341c1871067245e29ae1c955e2f40a0af218c28d7ade0cc1a209bb06"
iso_url = "https://dl.fedoraproject.org/pub/fedora/linux/development/36/Kinoite/x86_64/iso/Fedora-Kinoite-ostree-x86_64-36-20220322.n.0.iso"

kickstart = "ks-fedora36-kinoite.cfg"
ostree_remote = "https://ostree.fedoraproject.org"
ostree_remote_name = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key = "/etc/pki/rpm-gpg/"
crypto_policy = "DEFAULT:SHA1"
vagrantfile_template = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target = "graphical.target"
