vm_name             = "fedora38-silverblue"
version_description = <<-EOF
Fedora 38 Silverblue

https://silverblue.fedoraproject.org/

Packer config: https://github.com/fkrull/atomic-workstation
EOF

os_version   = "38.1.6"
iso_checksum = "sha256:0569d072cddb64fa08773d9f7649f2f1f55a4c04228d47042d405a6a10ffe1c6"
iso_url      = "https://dl.fedoraproject.org/pub/fedora/linux/releases/38/Silverblue/x86_64/iso/Fedora-Silverblue-ostree-x86_64-38-1.6.iso"

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
