data "template_file" "ssh_users" {
  template = "$${user}:$${key}"

  vars = {
    user = var.ssh_user
    key  = file("/project/.ssh/id_rsa.pub")
  }
}
