resource "aws_instance" "nat_instance" {
  count         = var.enabled ? 1 : 0
  ami           = var.nat_instance_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet_pub.0.id
  key_name      = aws_key_pair.ssh_key.0.id
  vpc_security_group_ids = [
    aws_security_group.sg_nat_instance.0.id
  ]

  associate_public_ip_address = true
  # Disable source/destination checks as per https://docs.aws.amazon.com/vpc/latest/userguide/VPC_NAT_Instance.html
  source_dest_check = false

  tags = {
    Name = "${var.name}-nat_instance"
  }
}
