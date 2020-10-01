
provider "google" {
  credentials = file("${var.sa_terraform}")
  project     = var.gcp_project_id
  region      = var.gcp_region
  version     = "3.35.0"
}

provider "aws" {
  version = "3.8"
  region  = var.aws_region
}

terraform {
  backend "gcs" {
    bucket = {}
    #bucket     = "${var.state_bucket}"
  }
}
