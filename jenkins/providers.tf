provider "google" {
  credentials = "${file(var.credentials-path)}"
  project     = "${var.project-name}"
  region      = "${var.deploy-region}"
}
