vm_name = "fedora29-silverblue"
version_description = "Fedora 29 Silverblue\n\nhttps://silverblue.fedoraproject.org/\n\nPacker config: https://github.com/fkrull/atomic-workstation"

os_version = "29.1.2"
iso_checksum = "sha256:0167e4c08b188c623023e0eac259e29a46450cabb3dc1a495cf62ae249360129"
iso_url = "https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/29/Silverblue/x86_64/iso/Fedora-Silverblue-ostree-x86_64-29-1.2.iso"

kickstart = "ks-fedora29-silverblue.cfg"
ostree_remote_name = "fedora-workstation"
ostree_remote = "https://kojipkgs.fedoraproject.org/atomic/repo/"
ostree_gpg_key = "/etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-29-primary"
vagrantfile_template = "tpl/vagrantfile.silverblue.tpl"
systemd_target = "graphical.target"
