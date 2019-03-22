variable "credentials-path" {
  description = "Path of GCP credentials.json"
  default     = ".secrets/credentials.json"
}

variable "project-name" {
  description = "GCP project name"
  default     = "boj-vs-code"
}

variable "deploy-region" {
  description = "Region to be distributed"
  default     = "us-east1"
}

variable "deploy-zone" {
  description = "Zone to be distributed"
  default     = "us-east1-b"
}

variable "machine-type" {
  description = "Jenkins instance type (ex - f1-micro)"
  default     = "f1-micro"
}

variable "instance-initialize-script-path" {
  description = "Script Path for initialize instnace"
  default     = "scripts/install.sh"
}
