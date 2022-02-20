# Packer Templates for OSTree-based Fedora boxes
This repository contains Packer templates for Vagrant base boxes for some
OSTree-based Fedora variants:

* [Fedora Silverblue](https://silverblue.fedoraproject.org/) (formerly Atomic Workstation)
* [Fedora Kinoite](https://kinoite.fedoraproject.org/)
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
* [Fedora 34 Silverblue](https://app.vagrantup.com/fkrull/boxes/fedora34-silverblue)
* [Fedora 35 Silverblue](https://app.vagrantup.com/fkrull/boxes/fedora35-silverblue)
* [Fedora 35 Kinoite](https://app.vagrantup.com/fkrull/boxes/fedora35-kinoite)
* [Fedora 36 Silverblue](https://app.vagrantup.com/fkrull/boxes/fedora36-silverblue)
* [Fedora 36 Kinoite](https://app.vagrantup.com/fkrull/boxes/fedora36-kinoite)
* [Fedora IoT](https://app.vagrantup.com/fkrull/boxes/fedora-iot)

## Providers
* Virtualbox (`virtualbox`)
* Hyper-V (experimental) (`hyperv`)

## Building
Packer needs to be run for a specific box using one of the provided variables files.
In theory it's possible to build for all virtualization providers at once, but they
generally don't all run on any single system. Because of that Packer's `-only` flag
needs to be used to limit the providers to build for.

```shell
$ packer build -only="*.virtualbox" -var-file="vars/fedora-iot.pkrvars.hcl" .
```

### Using the Makefile
The included Makefile provides a target to run Packer for a specific provider using
a specific variables file, for example: `make virtualbox/fedora-iot`.

### Notes on Hyper-V
Hyper-V requires a pre-configured switch with DHCP support; internet access is currently not
required and is optional. The default switch does **not** work because the host's IP address is not
detected correctly. You can either use an external switch connected to the primary network interface
or an internal switch that has a DHCP server running on it. Packer will try to create or detect
a switch automatically. An explicit switch can be passed using the `hyperv_switch` Packer variable.

## Uploading
By default, the box files are not uploaded. The following variables control the
upload process:

* `vagrant_cloud_upload` - set to true to upload the box to Vagrant Cloud after building
* `vagrant_cloud_user` - the account name to prepend to the box tag
* `vagrant_cloud_token` - the Vagrant Cloud authentication token

These variables can be set in a `*.auto.pkrvars.hcl` file in the top-level directory
or passed directly to Packer (`-var=vagrant_cloud_upload=true`). When using the Makefile,
set the `PACKER_ARGS` variable: `make [target] PACKER_ARGS="-var=vagrant_cloud_upload=true"`.

## Proxy Settings
The templates respect the following network proxy environment variables
and forward them on to the virtual machine environment during the box creation
process:

* `http_proxy`
* `https_proxy`
* `ftp_proxy`
* `rsync_proxy`
* `no_proxy`
