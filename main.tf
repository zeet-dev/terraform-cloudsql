terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.4.0"
    }
  }
}

resource "google_project_service" "cloud_run_api" {
  service = "run.googleapis.com"
}

resource "google_compute_network" "private_network" {
  provider = google-beta

  name = "private-network-${var.db_name}"
}

resource "google_compute_global_address" "private_ip_address" {
  provider = google-beta

  name          = "private-ip-address-${var.db_name}"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.private_network.id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  provider = google-beta

  network                 = google_compute_network.private_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

resource "google_sql_database_instance" "main" {
  name             = var.db_name
  database_version = var.db_version
  region           = var.db_region

  depends_on = [
    google_project_service.cloud_run_api,
    google_service_networking_connection.private_vpc_connection
  ]

  settings {
    tier      = var.db_tier
    disk_size = var.db_storage
    disk_type = var.db_storage_type

    ip_configuration {
      ipv4_enabled                                  = var.db_ipv4_enabled
      private_network                               = google_compute_network.private_network.id
      enable_private_path_for_google_cloud_services = var.db_enable_private_path_for_google_cloud_services
    }
  }
}

resource "google_sql_user" "users" {
  instance = google_sql_database_instance.main.name

  name     = var.db_username
  password = var.db_password
}
