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

variable "sg_whitelist" {
  type = string
}

variable "alb_config" {
  type = map
}

variable "nat_instance_ami" {
  type = string
}
