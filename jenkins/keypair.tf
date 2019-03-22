resource "tls_private_key" "jenkins" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "local_file" "private-key-pem-file" {
  content  = "${tls_private_key.jenkins.private_key_pem}"
  filename = "${path.module}/.secrets/private.pem"
}

resource "local_file" "public-key-pem-file" {
  content  = "${tls_private_key.jenkins.public_key_pem}"
  filename = "${path.module}/.secrets/public.pem"
}
