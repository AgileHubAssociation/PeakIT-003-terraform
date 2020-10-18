
resource "aws_instance" "bastion" {
  count         = var.enabled ? 1 : 0
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet_pub.0.id
  key_name      = aws_key_pair.ssh_key.0.id
  vpc_security_group_ids = [
    aws_security_group.sg_bastion.0.id
  ]
  associate_public_ip_address = true

  tags = {
    Name = "${var.name}-bastion"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.bastion.0.private_ip} >> private_ips.txt"
  }
}
