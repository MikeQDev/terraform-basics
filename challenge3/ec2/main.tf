variable "instanceNames" {
  type = list(string)
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
  count = length(var.instanceNames)
  tags = {
    "Name" = var.instanceNames[count.index]
  }
  security_groups = var.securityGroups
}