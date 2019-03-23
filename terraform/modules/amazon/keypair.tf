resource "aws_key_pair" "ssh-keypair" {
  key_name   = "jenkins-ssh-keypair"
  public_key = "${tls_private_key.jenkins.public_key_openssh}"
}

resource "tls_private_key" "jenkins" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "local_file" "private-key-pem-file" {
  content  = "${tls_private_key.jenkins.private_key_pem}"
  filename = "${path.root}/.secrets/private.pem"
}

resource "local_file" "public-key-pem-file" {
  content  = "${tls_private_key.jenkins.public_key_pem}"
  filename = "${path.root}/.secrets/public.pem"
}
