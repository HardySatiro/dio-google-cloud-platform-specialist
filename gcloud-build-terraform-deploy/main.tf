terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "hard-solutions-94948"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "${var.network_name}"
}

resource "google_compute_instance" "vm_instance" {
  name         = "cloudbbuildterraform"
  machine_type = "f1-micro"
  tags = ["prod"]

  labels = {
    cost_center = "${var.squad_ia}"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}