provider "google" {
  credentials = "${file("${path.root}/${var.credentials-path}")}"
  project     = "${var.project-name}"
  region      = "${var.deploy-region}"
}
