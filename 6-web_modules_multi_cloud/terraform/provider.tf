
provider "google" {
  credentials = file("${var.sa_terraform}")
  project     = var.gcp_project_id
  region      = var.gcp_region
  version     = "3.35.0"
}

provider "aws" {
  version = "3.8"
  region  = var.aws_region
  # credentials are sourced from env variables
}

terraform {
  backend "gcs" {
    bucket = {}
    prefix  = "6-web_modules_multi_cloud"
    #bucket     = "${var.state_bucket}"
  }
}
