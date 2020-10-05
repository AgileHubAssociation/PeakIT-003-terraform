variable "name" {
  type = string
}

variable "subnet_pub" {
  type = list
}

variable "subnet_priv" {
  type = list
}

variable "sg_whitelist_ssh" {
  type = list
}
