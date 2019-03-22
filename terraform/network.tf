resource "google_compute_network" "web" {
  name                    = "web"
  auto_create_subnetworks = false
}
