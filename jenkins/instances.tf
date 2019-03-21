resource "google_compute_instance" "jenkins" {
  name         = "jenkins-instance"
  machine_type = "${var.machine-type}"
  zone         = "${var.deploy-zone}"
  tags         = ["jenkins"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network = "default"
  }
}
