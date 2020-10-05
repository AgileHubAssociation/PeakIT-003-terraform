output "aws_bastion_public_ip" {
  value = aws_instance.bastion.*.public_ip
}

output "aws_instance_private_ip" {
  value = aws_instance.example.*.private_ip
}

output "aws_nat_instance_public_ip" {
  value = aws_instance.nat_instance.*.public_ip
}

output "alb_dns_name" {
  value = aws_alb.alb.0.dns_name
}