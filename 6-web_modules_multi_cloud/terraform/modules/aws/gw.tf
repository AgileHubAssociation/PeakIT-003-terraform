resource "aws_internet_gateway" "internet_gw" {
  count  = var.enabled ? 1 : 0
  vpc_id = aws_vpc.vpc.0.id

  tags = {
    Name = "${var.name}-gw"
  }
}
