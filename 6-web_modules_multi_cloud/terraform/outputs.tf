output "aws_bastion_public_ip" {
  value = module.aws.enabled ? module.aws.aws_bastion_public_ip : null
}

output "aws_nat_instance_public_ip" {
  value = module.aws.enabled ? module.aws.aws_nat_instance_public_ip : null
}

output "aws_instance_private_ip" {
  value = module.aws.enabled ? module.aws.aws_instance_private_ip : null
}

output "aws_alb_dns_name" {
  value = module.aws.enabled ? module.aws.alb_dns_name : null
}

output "aws_endpoint" {
  value = module.aws.enabled ? "http://${module.aws.alb_dns_name}" : null
}

output "aws_connection_string_ssh" {
  value = module.aws.enabled ? "ssh -J ec2-user@${module.aws.aws_bastion_public_ip} ec2-user@${module.aws.aws_instance_private_ip}" : null
}

output "gcp_bastion_public_ip" {
  value = module.gcp.enabled ? module.gcp.bastion_public_ip : null
}

output "gcp_web_private_ip" {
  value = module.gcp.enabled ? module.gcp.web_private_ip : null
}

output "gcp_ssh_user" {
  value = module.gcp.enabled ? module.gcp.ssh_user : null
}

output "gcp_connection_string_ssh" {
  value = module.gcp.enabled ? "ssh -J ${module.gcp.ssh_user}@${module.gcp.bastion_public_ip} ${module.gcp.ssh_user}@${module.gcp.web_private_ip}" : null
}

output "gcp_endpoint" {
  value = module.gcp.enabled ? "http://${module.gcp.lb_ip}" : null
}
