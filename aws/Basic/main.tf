resource "aws_vpc" "task2" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "task2"
  }
}
resource "aws_subnet" "first_subnet" {
  vpc_id     = aws_vpc.task2.id # implicit dependecy
  cidr_block = "10.0.0.0/24"
  tags = {
    "Name" = "first subnet"
  }

  depends_on = [
    aws_vpc.task2
  ]

}
resource "aws_subnet" "second_subnet" {
  vpc_id     = aws_vpc.task2.id # implicit dependecy
  cidr_block = "10.0.1.0/24"
  tags = {
    "Name" = "second subnet"
  }

  depends_on = [
    aws_vpc.task2
  ]

}
resource "aws_subnet" "third_subnet" {
  vpc_id     = aws_vpc.task2.id # implicit dependecy
  cidr_block = "10.0.2.0/24"
  tags = {
    "Name" = "third subnet"
  }

  depends_on = [
    aws_vpc.task2
  ]

}
resource "aws_subnet" "fourth_subnet" {
  vpc_id     = aws_vpc.task2.id # implicit dependecy
  cidr_block = "10.0.3.0/24"
  tags = {
    "Name" = "fourth subnet"
  }

  depends_on = [
    aws_vpc.task2
  ]

}
resource "aws_subnet" "fifth_subnet" {
  vpc_id     = aws_vpc.task2.id # implicit dependecy
  cidr_block = "10.0.4.0/24"
  tags = {
    "Name" = "fifth subnet"
  }

  depends_on = [
    aws_vpc.task2
  ]

}
resource "aws_subnet" "sixth_subnet" {
  vpc_id     = aws_vpc.task2.id # implicit dependecy
  cidr_block = "10.0.5.0/24"
  tags = {
    "Name" = "sixth subnet"
  }

  depends_on = [
    aws_vpc.task2
  ]

}

