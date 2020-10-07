resource "google_compute_instance" "bastion" {
  count                     = var.enabled ? 1 : 0
  name                      = "${var.name}-bastion"
  project                   = var.project_id
  machine_type              = var.compute_web["type"]
  zone                      = var.gcp_zones
  allow_stopping_for_update = true

  metadata = {
    ssh-keys = "${join("\n", data.template_file.ssh_users.*.rendered)}"
  }

  boot_disk {
    initialize_params {
      image = var.compute_web["image"]
      size  = var.compute_web["disk"]
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_bastion.0.self_link

    access_config {
      nat_ip       = google_compute_address.bastion_ip.0.address
      network_tier = "STANDARD"
    }
  }

  tags = ["bastion"]
}

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

  tags = [var.http_port_name]

  metadata_startup_script = data.template_file.compute_instance_init.rendered

}


data "template_file" "compute_instance_init" {
  template = file("${path.module}/templates/example.tpl")
}


resource "google_compute_instance_group" "ig" {
  count = var.enabled ? 1 : 0
  name  = "${var.name}-ig"
  zone  = var.gcp_zones

  instances = [google_compute_instance.web.0.self_link]

  named_port {
    name = var.http_port_name
    port = var.http_port
  }

  lifecycle {
    create_before_destroy = true
  }
}
