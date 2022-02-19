variable "box_version" {
  type        = string
  description = "Box version"
  default     = "1.4.1"
}

variable "vm_name" {
  type        = string
  description = "Name of the box"
}

variable "os_version" {
  type        = string
  description = "Version string of the box's OS"
}

variable "version_description" {
  type        = string
  description = "Box version description (for Vagrant Cloud)"
}

# Vagrant Cloud config
variable "vagrant_cloud_upload" {
  type        = bool
  description = "Whether to upload to Vagrant Cloud"
  default     = false
}

variable "vagrant_cloud_user" {
  type        = string
  description = "Vagrant Cloud user"
  default     = null
}

variable "vagrant_cloud_token" {
  type        = string
  description = "Vagrant Cloud upload token"
  default     = null
}

# VM config
variable "cpus" {
  type        = number
  description = "Number of CPUs for the VM"
  default     = 2
}

variable "disk_size" {
  type        = number
  description = "VM primary disk size (MB)"
  default     = 65536
}

variable "memory" {
  type        = number
  description = "VM amount of RAM (MB)"
  default     = 1024
}

variable "vagrantfile_template" {
  type        = string
  description = "Vagrantfile template"
}

# Virtualbox config
variable "virtualbox_gfx_controller" {
  type        = string
  description = "VirtualBox graphics controller type"
  default     = "vmsvga"
}

# Hyper-V config
variable "hyperv_switch" {
  type        = string
  description = "Name of the Hyper-V switch"
  default     = null
}

# ISO config
variable "iso_url" {
  type        = string
  description = "URL of ISO"
}

variable "iso_checksum" {
  type        = string
  description = "Checksum of ISO"
}

# system config
variable "kickstart" {
  type        = string
  description = "Kickstart file"
}

variable "crypto_policy" {
  type        = string
  description = "Fedora crypto policy (man crypto-policies)"
  default     = ""
}

variable "install_guest_additions" {
  type        = bool
  description = "Whether to install guest additions"
  default     = false
}

variable "install_vagrant_key" {
  type        = bool
  description = "Whether to install the vagrant well-known public SSH key"
  default     = true
}

variable "ssh_username" {
  type        = string
  description = "Username for post-install SSH"
  default     = "vagrant"
}

variable "ssh_password" {
  type        = string
  description = "Password for post-install SSH"
  default     = "vagrant"
}

variable "systemd_target" {
  type        = string
  description = "Default systemd target"
  default     = ""
}

# OSTree config
variable "ostree_remote_name" {
  type        = string
  description = "Name for the OSTree remote"
}

variable "ostree_remote" {
  type        = string
  description = "OSTree remote URL"
}

variable "ostree_remote_contenturl" {
  type        = string
  description = "OSTree remote content URL"
  default     = ""
}

variable "ostree_gpg_key" {
  type        = string
  description = "Path to the GPG key for the OSTree remote"
  default     = ""
}

# proxies
variable "http_proxy" {
  type    = string
  default = "${env("http_proxy")}"
}

variable "https_proxy" {
  type    = string
  default = "${env("https_proxy")}"
}

variable "ftp_proxy" {
  type    = string
  default = "${env("ftp_proxy")}"
}

variable "rsync_proxy" {
  type    = string
  default = "${env("rsync_proxy")}"
}

variable "no_proxy" {
  type    = string
  default = "${env("no_proxy")}"
}
