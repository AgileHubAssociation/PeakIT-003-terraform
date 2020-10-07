resource "google_compute_network" "network" {
  count                   = var.enabled ? 1 : 0
  name                    = "${var.name}-network"
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_bastion" {
  count                    = var.enabled ? 1 : 0
  name                     = "${var.name}-subnet-bastion"
  project                  = var.project_id
  network                  = google_compute_network.network.0.self_link
  ip_cidr_range            = lookup(var.subnet_pub[0], "cidr")
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "subnet_web" {
  count                    = var.enabled ? 1 : 0
  name                     = "${var.name}-subnet-web"
  project                  = var.project_id
  network                  = google_compute_network.network.0.self_link
  ip_cidr_range            = lookup(var.subnet_priv[0], "cidr")
  private_ip_google_access = true
}


resource "google_compute_address" "bastion_ip" {
  count        = var.enabled ? 1 : 0
  name         = "${var.name}-ip-bastion"
  address_type = "EXTERNAL"
  network_tier = "STANDARD"
}

resource "google_compute_global_address" "lb_ip" {
  count = var.enabled ? 1 : 0
  name  = "${var.name}-ip-lb"
}
