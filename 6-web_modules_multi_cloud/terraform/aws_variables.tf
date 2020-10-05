variable "sa_terraform" {
  type = string
}

variable "aws_region" {
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

variable "alb_config" {
  type = map
}

variable "nat_instance_ami" {
  type = string
}
