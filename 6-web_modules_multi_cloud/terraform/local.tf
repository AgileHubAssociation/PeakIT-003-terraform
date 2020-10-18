resource "local_file" "aws_connection" {
  content  = module.aws.enabled ? "ssh -J ec2-user@${module.aws.aws_bastion_public_ip} ec2-user@${module.aws.aws_instance_private_ip}" : null
  filename = "${path.module}/local/connection_string_aws"
}

resource "local_file" "gcp_connection" {
  content  = module.gcp.enabled ? "ssh -J ${module.gcp.ssh_user}@${module.gcp.bastion_public_ip} ${module.gcp.ssh_user}@${module.gcp.web_private_ip}" : null
  filename = "${path.module}/local/connection_string_gcp"
}