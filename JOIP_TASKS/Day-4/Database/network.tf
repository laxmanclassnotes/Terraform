resource "aws_vpc" "basic" {
  cidr_block = var.basic-cidr-range
  tags = {
    Name = "basic"
  }
}

resource "aws_subnet" "subnets" {
  
}
