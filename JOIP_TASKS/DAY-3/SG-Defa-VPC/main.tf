resource "aws_default_vpc" "default" {
  enable_dns_hostnames = true
  tags = {
    name = "default vpc"
  }
}
resource "aws_security_group" "securitygr" {
  name        = "sgdefault"
  description = "allow tls inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "tls from vpc"
    from_port   = "0"
    to_port     = "65535"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "allow_tls"
  }
}
 

# resource "aws_default_vpc" "default" {
  # enable_dns_hostnames = true
  # tags = {
    # name = "default vpc"
  # }
# }
# 
# 
# data "aws_vpc" "terraform" {
  # id = aws_default_vpc.default.id
# }