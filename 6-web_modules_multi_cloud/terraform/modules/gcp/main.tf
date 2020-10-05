# locals {
#   enabled = var.enabled
# }

# resource "google_compute_network" "network" {
#   count                   = local.enabled ? 1 : 0
#   name                    = "network-${var.name}"
#   project                 = var.project_id
#   auto_create_subnetworks = false
# }

