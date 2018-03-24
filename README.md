# Packer templates for Fedora Atomic Workstation

This repository contains Packer templates for Vagrant base boxes for Fedora Atomic Workstation.

## Current Boxes

* [Fedora 26 Atomic Workstation](https://app.vagrantup.com/fkrull/boxes/fedora26-atomic-workstation)

## Building the Vagrant boxes with Packer

    $ packer build -var-file=fedora26-atomic-workstation.json atomicws.json

To only build boxes for a specific VM provider, use the `-only` parameter:

    $ packer build -only=virtualbox-iso -var-file=fedora26-atomic-workstation.json atomicws.json

The following virtualization providers are supported:

* `virtualbox-iso` - [VirtualBox](https://www.virtualbox.org) desktop virtualization
* `parallels-iso` - [Parallels](http://www.parallels.com/products/desktop/whats-new/) desktop virtualization (Requires the Pro Edition - Desktop edition won't work)
* `vmware-iso` - [VMware Fusion](https://www.vmware.com/products/fusion) or [VMware Workstation](https://www.vmware.com/products/workstation) desktop virtualization

### Proxy Settings

The templates respect the following network proxy environment variables
and forward them on to the virtual machine environment during the box creation
process, should you be using a proxy:

* `http_proxy`
* `https_proxy`
* `ftp_proxy`
* `rsync_proxy`
* `no_proxy`
