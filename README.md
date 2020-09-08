# Packer Templates for OSTree-based Fedora boxes

This repository contains Packer templates for Vagrant base boxes for some
OSTree-based Fedora variants:

* [Fedora Silverblue](https://silverblue.fedoraproject.org/) (formerly Atomic Workstation)
* [Fedora IoT](https://iot.fedoraproject.org/)

## Current Boxes

* [Fedora 26 Atomic Workstation](https://app.vagrantup.com/fkrull/boxes/fedora26-atomic-workstation)
* [Fedora 27 Atomic Workstation](https://app.vagrantup.com/fkrull/boxes/fedora27-atomic-workstation)
* [Fedora 28 Atomic Workstation](https://app.vagrantup.com/fkrull/boxes/fedora28-atomic-workstation)
* [Fedora 29 Silverblue](https://app.vagrantup.com/fkrull/boxes/fedora29-silverblue)
* [Fedora 30 Silverblue](https://app.vagrantup.com/fkrull/boxes/fedora30-silverblue)
* [Fedora 31 Silverblue](https://app.vagrantup.com/fkrull/boxes/fedora31-silverblue)
* [Fedora 32 Silverblue](https://app.vagrantup.com/fkrull/boxes/fedora32-silverblue)
* [Fedora 33 Silverblue](https://app.vagrantup.com/fkrull/boxes/fedora33-silverblue)
* [Fedora IoT](https://app.vagrantup.com/fkrull/boxes/fedora-iot)

## Building

Run `make` using the `<provider>/<boxname>` targets. `<boxname>` is the name of the variable file
without the extension. `<provider>` may be one of the following:

* `virtualbox` - build for VirtualBox
* `hyperv` - build for Hyper-V (experimental)

#### Notes on Hyper-V

Hyper-V requires a pre-configured switch with DHCP support; internet access is currently not
required and is optional. The default switch does **not** work because the host's IP address is not
detected correctly. You can either use an external switch connected to the primary network interface
or an internal switch that has a DHCP server running on it.

The name of the switch needs to be passed to the Makefile in the `HYPERV_SWITCH` variable:

```
$ make HYPERV_SWITCH=external-switch hyperv/all
```

## Releasing

By default, the box files are not uploaded. To do so, call make with `UPLOAD=upload` and add your
Vagrant Cloud authentication token in the `vagrant-cloud-token.json` file. Before uploading a
box for the first time, it needs to be created in the [Vagrant Cloud web interface](https://app.vagrantup.com).

The OS version is set in the vars file based on the version of the ISO. For example:
`28.1.1` for the `Fedora-AtomicWorkstation-ostree-x86_64-28-1.1.iso` image. The box
version in `version.json` is appended to the OS version. It can be incremented
for other changes.

## Proxy Settings

The templates respect the following network proxy environment variables
and forward them on to the virtual machine environment during the box creation
process, should you be using a proxy:

* `http_proxy`
* `https_proxy`
* `ftp_proxy`
* `rsync_proxy`
* `no_proxy`
