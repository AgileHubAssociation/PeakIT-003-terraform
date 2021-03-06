# locals {
#   name = "network-${var.name}"
# }

resource "google_compute_network" "network" {
  count                   = var.gcp ? 1 : 0
  name                    = "network-${var.name}"
  project                 = var.gcp_project_id
  auto_create_subnetworks = false

  timeouts {
    # default values 4m for all
    create = "5m"
    update = "5m"
    delete = "5m"
  }
}


resource "aws_vpc" "vpc" {
  count                = var.gcp ? 0 : 1
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  # enable_dns_support is set to true from the above
  tags = {
    Name = "network-${var.name}"
  }
}
