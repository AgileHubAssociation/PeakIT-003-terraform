output "bastion_public_ip" {
  description = "The public IP of the bastion"
  value       = google_compute_address.bastion_ip[0].address
}

output "web_private_ip" {
  description = "The private IP of the bastion"
  value       = google_compute_instance.web[0].network_interface[0].network_ip
}