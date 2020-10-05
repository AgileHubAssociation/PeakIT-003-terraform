locals {
  enabled = var.enabled
}

resource "aws_vpc" "vpc" {
  count                = local.enabled ? 1 : 0
  cidr_block           = var.cidr_block
  tags = {
    Name = "network-${var.name}"
  }
}

