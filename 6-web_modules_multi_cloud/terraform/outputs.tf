output "aws_bastion_public_ip" {
  value = module.aws.aws_bastion_public_ip
}

output "aws_nat_instance_public_ip" {
  value = module.aws.aws_nat_instance_public_ip
}

output "aws_instance_private_ip" {
  value = module.aws.aws_instance_private_ip
}

output "aws_alb_dns_name" {
  value = module.aws.alb_dns_name
}
