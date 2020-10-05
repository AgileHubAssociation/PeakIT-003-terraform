module "aws" {
  source     = "./modules/aws"
  name       = var.name
  cidr_block = var.vpc_cidr
  enabled    = false
}

module "gcp" {
  source     = "./modules/gcp"
  name       = var.name
  project_id = var.gcp_project_id
  enabled    = false
}
