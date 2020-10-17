resource "google_compute_global_forwarding_rule" "fr_http" {
  count      = var.enabled ? 1 : 0
  name       = "${var.name}-fr-web-http"
  ip_address = google_compute_global_address.lb_ip.0.address
  port_range = var.http_port
  target     = google_compute_target_http_proxy.target-http.0.self_link
}

resource "google_compute_target_http_proxy" "target-http" {
  count   = var.enabled ? 1 : 0
  name    = "${var.name}-target-http"
  url_map = google_compute_url_map.lb_http.0.self_link
}

resource "google_compute_url_map" "lb_http" {
  count           = var.enabled ? 1 : 0
  name            = "${var.name}-lb-http"
  default_service = google_compute_backend_service.backend_web.0.self_link

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_backend_service" "backend_web" {
  count         = var.enabled ? 1 : 0
  name          = "${var.name}-backend-web"
  health_checks = [google_compute_http_health_check.health_web.0.self_link]
  port_name     = var.http_port_name
  backend {
    group = google_compute_instance_group.ig.0.self_link
  }
}

resource "google_compute_http_health_check" "health_web" {
  count               = var.enabled ? 1 : 0
  name                = "${var.name}-health-web"
  port                = var.http_port
  request_path        = "/"
  check_interval_sec  = 5
  timeout_sec         = 3
  unhealthy_threshold = 10
}

# resource "null_resource" "backends" {
#   count = var.enabled ? 1 : 0

#   triggers = {
#     group = google_compute_instance_group.ig.0.self_link
#   }
# }
