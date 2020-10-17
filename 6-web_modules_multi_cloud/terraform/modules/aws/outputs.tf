output "aws_bastion_public_ip" {
  value = var.enabled ? aws_instance.bastion.0.public_ip : null
}

output "aws_instance_private_ip" {
  value = var.enabled ? aws_instance.example.0.private_ip : null
}

output "aws_nat_instance_public_ip" {
  value = var.enabled ? aws_instance.nat_instance.0.public_ip : null
}

output "alb_dns_name" {
  value = var.enabled ? aws_alb.alb.0.dns_name : null
}

output "enabled" {
  value = var.enabled
}
