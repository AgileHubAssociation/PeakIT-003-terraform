resource "google_compute_router_nat" "nat" {
  count                              = var.enabled ? 1 : 0
  name                               = "${var.name}-nat"
  router                             = google_compute_router.router.0.name
  region                             = var.gcp_region
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [google_compute_address.nat_ips.0.self_link]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_address" "nat_ips" {
  count  = var.enabled ? 1 : 0
  name   = "${var.name}-nat-external-ip"
  region = var.gcp_region
}

resource "google_compute_router" "router" {
  count   = var.enabled ? 1 : 0
  name    = "${var.name}-router"
  network = google_compute_network.network.0.self_link
  bgp {
    asn = 64514
  }
}
