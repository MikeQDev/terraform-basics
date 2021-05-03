variable "instanceName" {
  type = string
}
variable "instanceType" {
  type = string
  default = "t2.micro"
}
variable "securityGroups" {
    type = list(string)
    default = []
}

resource "aws_instance" "ec2instasnce" {
  ami = "xyz"
  instance_type = var.instanceType
  tags = {
    "Name" = var.instanceName
  }
  security_groups = var.securityGroups
}