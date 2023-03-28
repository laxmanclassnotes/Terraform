resource "aws_vpc" "basic" {
  cidr_block = var.basic-cidr-range
  tags = {
    Name = "basic"
  }
}
resource "aws_subnet" "app1" {
  vpc_id            = aws_vpc.basic.id
  availability_zone = "${var.region}a"
  cidr_block        = var.app1-cidr
  tags = {
    "Name" = "app1"
  }
  depends_on = [
    aws_vpc.basic
  ]
}
resource "aws_subnet" "app2" {
  vpc_id            = aws_vpc.basic.id
  availability_zone = "${var.region}b"
  cidr_block        = var.app2-cidr
  tags = {
    "Name" = "app2"
  }
  depends_on = [
    aws_vpc.basic
  ]
}
resource "aws_subnet" "web1" {
  vpc_id            = aws_vpc.basic.id
  availability_zone = "${var.region}a"
  cidr_block        = var.web1-cidr
  tags = {
    "Name" = "web1"
  }
  depends_on = [
    aws_vpc.basic
  ]
}
resource "aws_subnet" "web2" {
  vpc_id            = aws_vpc.basic.id
  availability_zone = "${var.region}b"
  cidr_block        = var.web2-cidr
  tags = {
    "Name" = "web2"
  }
  depends_on = [
    aws_vpc.basic
  ]
}