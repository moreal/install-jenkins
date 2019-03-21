output "public_ip" {
  value = "${google_compute_instance.jenkins.network_interface.0.network_ip}"
}
