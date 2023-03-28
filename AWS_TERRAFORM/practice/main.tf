resource "aws_vpc" "basic" {
  cidr_block = var.basic-cidr-range
  tags = {
    Name = "basic"
  }
}
resource "aws_subnet" "subnets" {
  count             = 6 # length(var.basic-subnet-cidrs)
  vpc_id            = aws_vpc.basic.id
  cidr_block        = var.basic-subnet-cidrs[count.index]
  availability_zone = "${var.region}${var.basic-subnet-azs[count.index]}"
  depends_on = [
    aws_vpc.basic
  ]
  tags = {
    Name = var.basic-subnet-Names[count.index]
  }
}
