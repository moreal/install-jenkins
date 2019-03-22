output "public_ip" {
  value = "${google_compute_instance.jenkins.network_interface.0.network_ip}"
}

output "internal_ip" {
  value = "${google_compute_address.jenkins-internal-ip.address}"
}
