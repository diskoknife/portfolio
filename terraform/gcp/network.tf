resource "google_compute_network" "same-network" {
  name = "first-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "same-subnetwork" {
  ip_cidr_range = "172.16.0.0/16"
  name          = "first-subnetwork"
  network       = google_compute_network.same-network.id
  secondary_ip_range {
    range_name = "test-secondary-range"
    ip_cidr_range = "192.168.0.0/24"
  }
}