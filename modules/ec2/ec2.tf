variable "ec2name" {
    type = string
}

resource "aws_instance" "ec2" {
  ami = "123"
  instance_type = "t2.micro"
  tags = {
    "Name" = var.ec2name
  }
}

output "ec2id" {
  value = aws_instance.ec2.instance_type
}