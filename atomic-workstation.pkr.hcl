locals {
  boot_command                   = ["<tab> linux biosdevname=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.kickstart}<enter><enter>"]
  shutdown_command               = "echo ${var.ssh_password} | sudo -S shutdown -h now"
  virtualbox_post_shutdown_delay = "10s"
  execute_command                = "echo vagrant | {{ .Vars }} sudo -E -S bash \"{{ .Path }}\""
}

source "hyperv-iso" "hyperv" {
  boot_command       = local.boot_command
  communicator       = "ssh"
  cpus               = var.cpus
  disk_block_size    = 1
  disk_size          = var.disk_size
  enable_secure_boot = false
  generation         = 1
  http_directory     = "http"
  iso_checksum       = var.iso_checksum
  iso_urls           = [var.iso_url]
  memory             = var.memory
  shutdown_command   = local.shutdown_command
  ssh_password       = var.ssh_password
  ssh_timeout        = "60m"
  ssh_username       = var.ssh_username
  output_directory   = "output/build/${source.name}"
  #switch_name        = var.hyperv_switch
}

source "virtualbox-iso" "virtualbox" {
  boot_command             = local.boot_command
  communicator             = "ssh"
  cpus                     = var.cpus
  memory                   = var.memory
  disk_size                = var.disk_size
  gfx_controller           = var.virtualbox_gfx_controller
  guest_additions_mode     = "disable"
  guest_os_type            = var.virtualbox_guest_os_type
  hard_drive_discard       = true
  hard_drive_nonrotational = true
  http_directory           = "http"
  iso_checksum             = var.iso_checksum
  iso_urls                 = [var.iso_url]
  post_shutdown_delay      = local.virtualbox_post_shutdown_delay
  shutdown_command         = local.shutdown_command
  ssh_password             = var.ssh_password
  ssh_timeout              = "60m"
  ssh_username             = var.ssh_username
  virtualbox_version_file  = ".vbox_version"
  output_directory         = "output/build/${source.name}"
}

build {
  sources = [
    "source.hyperv-iso.hyperv",
    "source.virtualbox-iso.virtualbox"
  ]

  provisioner "shell" {
    environment_vars = [
      "http_proxy=${var.http_proxy}",
      "https_proxy=${var.https_proxy}",
      "ftp_proxy=${var.ftp_proxy}",
      "rsync_proxy=${var.rsync_proxy}",
      "no_proxy=${var.no_proxy}",
      "INSTALL_VAGRANT_KEY=${var.install_vagrant_key}",
      "INSTALL_GUEST_ADDITIONS=${var.install_guest_additions}",
      "SSH_USERNAME=${var.ssh_username}",
      "SSH_PASSWORD=${var.ssh_password}",
      "OSTREE_REMOTE_NAME=${var.ostree_remote_name}",
      "OSTREE_REMOTE=${var.ostree_remote}",
      "OSTREE_REMOTE_CONTENTURL=${var.ostree_remote_contenturl}",
      "OSTREE_GPG_KEY=${var.ostree_gpg_key}",
      "CRYPTO_POLICY=${var.crypto_policy}",
      "SYSTEMD_TARGET=${var.systemd_target}",
      "HOSTNAME=${var.vm_name}",
      "BOX_VERSION=${var.os_version}-${var.box_version}"
    ]
    execute_command = local.execute_command
    scripts = [
      "script/sshd.sh",
      "script/hostname.sh",
      "script/virtualbox.sh",
      "script/systemd-target.sh",
      "script/vagrant.sh",
      "script/ostree-remote.sh",
      "script/crypto-policies.sh"
    ]
  }

  provisioner "shell" {
    execute_command   = local.execute_command
    expect_disconnect = true
    pause_after       = "1m"
    script            = "script/reboot.sh"
  }

  provisioner "shell" {
    execute_command = local.execute_command
    script          = "script/cleanup.sh"
  }

  post-processors {
    post-processor "vagrant" {
      keep_input_artifact  = false
      vagrantfile_template = var.vagrantfile_template
      output               = "output/${source.name}/${var.vm_name}-${var.os_version}-${var.box_version}.box"
    }

    dynamic "post-processor" {
      for_each = [for upload in [var.vagrant_cloud_upload] : upload if upload]
      labels   = ["vagrant-cloud"]
      content {
        box_tag             = "${var.vagrant_cloud_user}/${var.vm_name}"
        version             = "${var.os_version}-${var.box_version}"
        version_description = var.version_description
        access_token        = var.vagrant_cloud_token
      }
    }
  }
}
