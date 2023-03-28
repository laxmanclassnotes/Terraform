resource "aws_vpc" "basic" {
  cidr_block = var.basic-cidr-range
  tags = {
    Name = "basic"
  }
}

resource "aws_subnet" "subnets" {
  count             = length(var.basic-subnet-names)
  vpc_id            = aws_vpc.basic.id
  cidr_block        = cidrsubnet(var.basic-cidr-range, 8, count.index)
  availability_zone = "${var.region}${var.basic-subnet-azs[count.index]}"
  depends_on = [
    aws_vpc.basic
  ]
  tags = {
    Name = var.basic-subnet-names[count.index]
  }
}
