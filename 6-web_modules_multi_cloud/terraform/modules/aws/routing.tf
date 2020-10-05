resource "aws_route_table" "rt_pub" {
  count  = var.enabled ? 1 : 0
  vpc_id = aws_vpc.vpc.0.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.0.id
  }

  tags = {
    Name = "${var.name}-rt-pub"
  }
}

resource "aws_route_table_association" "rta_pub" {
  count          = var.enabled ? 1 : 0
  subnet_id      = aws_subnet.subnet_pub.0.id
  route_table_id = aws_route_table.rt_pub.0.id
}

resource "aws_route_table" "rt_priv" {
  count  = var.enabled ? 1 : 0
  vpc_id = aws_vpc.vpc.0.id

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = aws_instance.nat_instance.0.id
  }

  tags = {
    Name = "${var.name}-rt-priv"
  }
}

resource "aws_route_table_association" "rta_priv" {
  count          = var.enabled ? 1 : 0
  subnet_id      = aws_subnet.subnet_priv.0.id
  route_table_id = aws_route_table.rt_priv.0.id
}
