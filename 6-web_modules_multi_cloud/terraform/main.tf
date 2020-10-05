module "aws" {
  source  = "./modules/aws"
  enabled = true

  name             = var.name
  vpc_cidr         = var.vpc_cidr
  subnet_pub       = var.subnet_pub
  subnet_priv      = var.subnet_priv
  instance_type    = var.instance_type
  instance_ami     = var.instance_ami
  sg_whitelist     = var.sg_whitelist
  sg_whitelist_ssh = var.sg_whitelist_ssh
  alb_config       = var.alb_config
  nat_instance_ami = var.nat_instance_ami

}

module "gcp" {
  source  = "./modules/gcp"
  enabled = false

  name       = var.name
  project_id = var.gcp_project_id

}
