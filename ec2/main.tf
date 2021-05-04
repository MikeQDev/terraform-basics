provider "aws" {
    region = "us-east-2" 
}

/*resource "aws_vpc" "myVpc" {
    cidr_block = "192.168.0.0/16"
    tags = {
      "abc" = "def"
    }
}*/

resource "aws_instance" "myInstance" {
    ami = "ami-08962a4068733a2b6"
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.webtraffic.name ]
    count = 3 // Note: TF will catch issues such as attempting to apply EIP to a non-specific instances
}

output "instanceIds" {
    value = [ aws_instance.myInstance.*.id ]
}

resource "aws_security_group" "webtraffic" {
    name = "allow https"
    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

variable "ingressrules" {
    type = list(number)
    default = [80,443]
}

variable "egressrules" {
    type = list(number)
    default = [80,443,25,3306,53,8080]
}

/*resource "aws_eip" "elasitc" {
    instance = aws_instance.myInstance.id
}

output "EIP" {
    value = aws_eip.elasitc.public_ip
}*/