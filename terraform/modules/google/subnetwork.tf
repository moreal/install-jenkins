resource "google_compute_subnetwork" "web-subnetwork" {
  name          = "web-subnetwork"
  ip_cidr_range = "10.2.2.0/24"
  region        = "${var.deploy-region}"
  network       = "${google_compute_network.web.self_link}"
}
