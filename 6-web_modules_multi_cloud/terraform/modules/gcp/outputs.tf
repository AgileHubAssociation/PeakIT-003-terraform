output "bastion_public_ip" {
  description = "The public IP of the bastion"
  value       = var.enabled ? google_compute_address.bastion_ip.0.address : null
}

output "web_private_ip" {
  description = "The private IP of the bastion"
  value       = var.enabled ? google_compute_instance.web.0.network_interface.0.network_ip : null
}

output "ssh_user" {
  description = "The name of the user injected into the instance"
  value       = var.enabled ? var.ssh_user : null
}

output "enabled" {
  value = var.enabled
}

output "lb_ip" {
  value = var.enabled ? google_compute_global_address.lb_ip.0.address : null
}
