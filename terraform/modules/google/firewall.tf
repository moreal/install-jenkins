resource "google_compute_firewall" "allow-icmp" {
  name    = "icmp-firewall"
  network = "${google_compute_network.web.name}"

  source_ranges = ["0.0.0.0/0"]

  // ping
  allow {
    protocol = "icmp"
  }

  source_tags = ["web-network", "icmp"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "ssh-firewall"
  network = "${google_compute_network.web.name}"

  source_ranges = ["0.0.0.0/0"]

  // ssh
  allow {
    protocol = "tcp"
    ports    = ["443", "17777"]
  }

  source_tags = ["web-network", "ssh"]
}

resource "google_compute_firewall" "allow-http" {
  name    = "http-firewall"
  network = "${google_compute_network.web.name}"

  source_ranges = ["0.0.0.0/0"]

  // http
  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }

  source_tags = ["web-network", "http"]
}
