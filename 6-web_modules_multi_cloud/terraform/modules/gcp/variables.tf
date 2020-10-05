variable "project_id" {
  type = string
}

variable "name" {
  type = string
}

variable "enabled" {
  type = bool
}

variable "subnet_priv" {
  type = list
}

variable "subnet_pub" {
  type = list
}

variable "sg_whitelist_ssh" {
  type = list
}

variable "compute_web" {
  type = map
}

variable "gcp_zones" {
  type = string
}