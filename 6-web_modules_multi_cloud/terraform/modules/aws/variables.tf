variable "name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_ami" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_pub" {
  type = list
}

variable "subnet_priv" {
  type = list
}

variable "sg_whitelist" {
  type = string
}

variable "sg_whitelist_ssh" {
  type = list
}

variable "enabled" {
  type = bool
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = false
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "alb_config" {
  type = map
}

variable "nat_instance_ami" {
  type = string
}
