resource "aws_vpc" "vpc" {
  count                = var.enabled ? 1 : 0
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = "${var.name}-vpc"
  }
}

resource "aws_subnet" "subnet_pub" {
  count                   = var.enabled ? 1 : 0
  vpc_id                  = aws_vpc.vpc.0.id
  cidr_block              = lookup(var.subnet_pub[0], "cidr")
  availability_zone       = lookup(var.subnet_pub[0], "az")
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.name}-subnet-pub"
  }
}

resource "aws_subnet" "subnet_pub_alb_req" {
  count                   = var.enabled ? 1 : 0
  vpc_id                  = aws_vpc.vpc.0.id
  cidr_block              = lookup(var.subnet_pub[1], "cidr")
  availability_zone       = lookup(var.subnet_pub[1], "az")
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.name}-subnet-pub-alb-req"
  }
}

resource "aws_subnet" "subnet_priv" {
  count                   = var.enabled ? 1 : 0
  vpc_id                  = aws_vpc.vpc.0.id
  cidr_block              = lookup(var.subnet_priv[0], "cidr")
  availability_zone       = lookup(var.subnet_priv[0], "az")
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.name}-subnet-priv"
  }
}
