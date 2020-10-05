resource "google_compute_instance" "web" {
  count                     = var.enabled ? 1 : 0
  name                      = "${var.name}-web"
  project                   = var.project_id
  machine_type              = var.compute_web["type"]
  zone                      = var.gcp_zones
  allow_stopping_for_update = true

  metadata = {
    ssh-keys = "${join("\n", data.template_file.ssh_users.*.rendered)}"
  }

  boot_disk {
    initialize_params {
      image = "https://www.googlewebs.com/compute/v1/projects/centos-cloud/global/images/${var.compute_web["image"]}"
      size  = var.compute_web["disk"]
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_web.0.self_link
  }

  tags = ["web"]

  metadata_startup_script = data.template_file.compute_instance_init.rendered

#   lifecycle {
#     ignore_changes = [
#       "metadata_startup_script"
#     ]
#   }
}


data "template_file" "compute_instance_init" {
  template = file("${path.module}/templates/example.tpl")
}