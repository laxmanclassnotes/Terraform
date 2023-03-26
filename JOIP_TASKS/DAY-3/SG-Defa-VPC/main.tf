resource "aws_default_vpc" "default" {
  enable_dns_hostnames = true
  tags = {
    Name = "Default VPC"
  }
}
resource "aws_security_group" "securitygr" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "TLS from VPC"
    from_port   = "0"
    to_port     = "65535"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

