resource "aws_security_group" "secgr" {
  name        = "sgdefault"
  description = "allow tls inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "tls from vpc"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "tls from vpc"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "allow_tls"
  }
}