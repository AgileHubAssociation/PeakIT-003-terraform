data "template_file" "ssh_users" {
  template = "$${user}:$${key}"

  vars = {
    user = "admin"
    key  = file("/project/.ssh/id_rsa.pub")
  }
}
