variable "project-name" {
  description = "GCP project name"
  default     = "boj-vs-code"
}

variable "deploy-region" {
  description = "Region to be distributed (ex - us-west-2)"
  default     = "us-west-2"
}

variable "machine-type" {
  description = "Jenkins instance type (ex - f2.micro)"
  default     = "f2.micro"
}

variable "instance-initialize-script-path" {
  description = "Script Path for initialize instnace"
  default     = "scripts/install.sh"
}
