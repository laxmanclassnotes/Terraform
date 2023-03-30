resource "aws_vpc" "samplevpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "samplevpc"
  }
}
