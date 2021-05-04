provider "aws" {
  region = "us-east-2"
}

// File-based vars: terraform plan -var-file={test,prod}.tfvars
// CLI-defined var: terraform plan -var 'serverCount=3'
// If file/input (and default value) not supplied, 'Enter a value' prompt will appear
variable "serverCount" {
  type = number
}

resource "aws_instance" "instance" {
  ami           = "xyz"
  instance_type = "t2.micro"
  count         = var.serverCount
}