locals {
  port_cidr_map = {
    22   = "10.0.0.0/24"
    80   = "192.168.1.0/24"
    443  = "172.16.0.0/16"
    8080 = "10.10.10.0/24"
    3000 = "192.168.100.0/24"
  }
}

resource "aws_security_group" "demo" {

  name        = "demo-sg"
  description = "Security Group"

  dynamic "ingress" {

    for_each = local.port_cidr_map

    content {
      description = "Inbound Rule"
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "demo-sg"
  }
}