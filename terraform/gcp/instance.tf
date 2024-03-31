resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = var.instance_type
  zone         = var.zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
    auto_delete = true
  }

 #

  network_interface {
    subnetwork = google_compute_subnetwork.same-subnetwork.id

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    scopes = ["cloud-platform"]
    email = google_service_account.default.email
  }
}

