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
    subnetwork = "${google_compute_subnetwork.web-subnetwork.self_link}"

    access_config {
      nat_ip = "${google_compute_address.jenkins-internal-ip.address}"
    }
  }

  metadata {
    startup-script = "${file("${path.root}/${var.instance-initialize-script-path}")}"
    ssh-keys       = "ubuntu:${tls_private_key.jenkins.public_key_openssh}"
  }

  depends_on = [
    "google_compute_subnetwork.web-subnetwork",
  ]
}
