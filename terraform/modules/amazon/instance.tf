# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-2018.03.0.20181116-x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}

resource "aws_instance" "jenkins-instance" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.ssh-keypair.key_name}"

  tags {
    Name = "jenkins"
  }

  connection {
    type        = "ssh"
    user        = "root"
    private_key = "${file("${path.root}/.secrets/private.pem")}"
  }

  provisioner "remote-exec" {
    script = "${path.root}/${var.instance-initialize-script-path}"
  }
}
