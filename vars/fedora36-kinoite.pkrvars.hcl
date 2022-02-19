vm_name = "fedora36-kinoite"
version_description = <<-EOF
Fedora 36 Kinoite

https://kinoite.fedoraproject.org/

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version = "36.0.20220219"
iso_checksum = "sha256:96da58ad9b945b1443015828399f7826b8fcb3cc750073af8cbc5ee23036d645"
iso_url = "https://dl.fedoraproject.org/pub/fedora/linux/development/36/Kinoite/x86_64/iso/Fedora-Kinoite-ostree-x86_64-36-20220219.n.0.iso"

kickstart = "ks-fedora36-kinoite.cfg"
ostree_remote = "https://ostree.fedoraproject.org"
ostree_remote_name = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key = "/etc/pki/rpm-gpg/"
crypto_policy = "DEFAULT:SHA1"
vagrantfile_template = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target = "graphical.target"
