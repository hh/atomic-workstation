# Packer Templates for Fedora Silverblue

This repository contains Packer templates for Vagrant base boxes for [Fedora Silverblue](https://silverblue.fedoraproject.org/)
(formerly Atomic Workstation).

## Current Boxes

* [Fedora 27 Atomic Workstation](https://app.vagrantup.com/fkrull/boxes/fedora27-atomic-workstation)
* [Fedora 28 Atomic Workstation](https://app.vagrantup.com/fkrull/boxes/fedora28-atomic-workstation)
* [Fedora 29 Silverblue](https://app.vagrantup.com/fkrull/boxes/fedora29-silverblue)

## Previous Boxes

* [Fedora 26 Atomic Workstation](https://app.vagrantup.com/fkrull/boxes/fedora26-atomic-workstation)

## Building

Run `make` to build everything. The following more specific targets are also available:

* **virtualbox/all** - build all boxes for the VirtualBox provider
* **virtualbox/\<box name\>** - build a specific box; `<box name>` matches one of the config JSON files

Currently, only the [VirtualBox](https://www.virtualbox.org) provider is supported. There's some
config for other providers still around, but it probably won't work out of the box.

## Releasing

By default, the box files are not uploaded. Pass `UPLOAD=upload` to make and set the
`VAGRANT_CLOUD_TOKEN` environment variable to upload the box to Vagrant Cloud.

The OS version is set in the vars file based on the version of the ISO. For example:
`28.1.1` for the `Fedora-AtomicWorkstation-ostree-x86_64-28-1.1.iso` image.

The box version in `version.json` is appended to the OS version. It can be incremented
for other changes.

### Proxy Settings

The templates respect the following network proxy environment variables
and forward them on to the virtual machine environment during the box creation
process, should you be using a proxy:

* `http_proxy`
* `https_proxy`
* `ftp_proxy`
* `rsync_proxy`
* `no_proxy`
