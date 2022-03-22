vm_name = "fedora36-silverblue"
version_description = <<-EOF
Fedora 36 Silverblue

https://silverblue.fedoraproject.org/

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version = "36.0.20220321"
iso_checksum = "sha256:178c7398924644d8a0476448cafc5e5e4dd00846fa33f69b6f2620ad177157fd"
iso_url = "https://dl.fedoraproject.org/pub/fedora/linux/development/36/Silverblue/x86_64/iso/Fedora-Silverblue-ostree-x86_64-36-20220321.n.0.iso"

kickstart = "ks-fedora36-silverblue.cfg"
ostree_remote = "https://ostree.fedoraproject.org"
ostree_remote_name = "fedora"
ostree_remote_contenturl = "mirrorlist=https://ostree.fedoraproject.org/mirrorlist"
ostree_gpg_key = "/etc/pki/rpm-gpg/"
crypto_policy = "DEFAULT:SHA1"
vagrantfile_template = "tpl/vagrantfile.silverblue.f33.tpl"
systemd_target = "graphical.target"
