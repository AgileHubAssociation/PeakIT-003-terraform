resource "local_file" "azure_k8s_dockerconfig_yaml" {
  content  = module.aws.enabled ? "ssh -J ec2-user@${module.aws.aws_bastion_public_ip} ec2-user@${module.aws.aws_instance_private_ip}" : null
  filename = "${path.module}/local/connection_string"
}
