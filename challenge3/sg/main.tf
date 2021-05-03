variable "sgName" {
  type = string
}
variable "ports" {
    type = list(number)
}
resource "aws_security_group" "securityGroup" {
    name = var.sgName
    dynamic "ingress" {
        iterator = port
        for_each = var.ports
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}
output "sgName" {
    value = aws_security_group.securityGroup.name
}