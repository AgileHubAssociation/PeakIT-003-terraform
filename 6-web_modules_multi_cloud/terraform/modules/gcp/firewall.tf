resource "google_compute_firewall" "allow_public_ssh" {
  count     = var.enabled ? 1 : 0
  name      = "${var.name}-fw-public-ssh"
  project   = var.project_id
  network   = google_compute_network.network.0.name
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.sg_whitelist_ssh
  target_tags   = ["bastion"]
}

resource "google_compute_firewall" "allow_private_ssh" {
  count     = var.enabled ? 1 : 0
  name      = "${var.name}-fw-private-ssh"
  project   = var.project_id
  network   = google_compute_network.network.0.name
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["${google_compute_subnetwork.subnet_bastion.0.ip_cidr_range}"]
}
