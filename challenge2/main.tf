provider "aws" {
    region = "us-east-2" 
}

resource "aws_instance" "dbServer" {
    ami = "xyz"
    instance_type = "t2.micro"
    tags = {
      "Name" = "dbServer"
    }
    user_data = file("server-script.sh")
}

output "dbServerPrivateIp" {
  value = aws_instance.dbServer.private_ip
}

output "publicIp" {
  value = aws_eip.elasticIp.public_ip
}

resource "aws_instance" "webServer" {
  ami = "xyz"
  instance_type = "t2.micro"
  tags = {
    "Name" = "webServer"
  }
  security_groups = [ aws_security_group.httpSecurityGroup.name ]
}

resource "aws_eip" "elasticIp" {
    instance = aws_instance.webServer.id
}

resource "aws_security_group" "httpSecurityGroup" {
    name = "httpSG"
    description = "allow http/s traffic"
    dynamic "ingress" {
        iterator = port
        for_each = var.httpPorts
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

variable "httpPorts" {
  type = list(number)
  default = [80,443]
}