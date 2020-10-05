resource "aws_instance" "example" {
  count         = var.enabled ? 1 : 0
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet_priv.0.id
  key_name      = aws_key_pair.ssh_key.0.id
  vpc_security_group_ids = [
    aws_security_group.sg_instance.0.id
  ]
  user_data = data.template_cloudinit_config.cloud_init_example.rendered

  tags = {
    Name = "${var.name}-web"
  }

  # lifecycle {
  #   ignore_changes = [
  #     user_data
  #   ]
  # }
}

data "template_file" "cloud_init_tpl" {
  template = file("${path.module}/templates/example.tpl")

  # vars = {
  #   name = value, even from tf
  # }
}

data "template_cloudinit_config" "cloud_init_example" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.cloud_init_tpl.rendered
  }
}
