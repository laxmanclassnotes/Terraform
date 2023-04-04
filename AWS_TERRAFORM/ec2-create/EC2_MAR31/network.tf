resource "aws_vpc" "myvpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "myvpc"
  }
}
resource "aws_subnet" "subnets" {
  count             = length(var.myvpc_info.subnet_names)
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = cidrsubnet(var.myvpc_info.vpc_cidr, 8, count.index)
  availability_zone = "${var.region}${var.myvpc_info.subnet_azs[count.index]}"

  depends_on = [
    aws_vpc.myvpc
  ]

  tags = {
    Name = var.myvpc_info.subnet_names[count.index]

  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "myigw"
  }

}
resource "aws_route_table" "myprivate" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "private"
  }
  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.myigw.id
  }

  depends_on = [
    aws_subnet.subnets
  ]
}

resource "aws_route_table" "mypublic" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "public"
  }
  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.myigw.id
  }

  depends_on = [
    aws_subnet.subnets
  ]
}

# resource "aws_route_table_association" "private_associations" {
#   count          = length(var.myvpc_info.subnet_names[count.index])
#   subnet_id      = aws_subnet.subnets.id
#   route_table_id = aws_route_table.myprivate.id
# }
# 
# resource "aws_route_table_association" "public_associations" {
#   gateway_id     = aws_internet_gateway.myigw.id
#   route_table_id = aws_route_table.mypublic.id
# 
# }
resource "aws_main_route_table_association" "private" {
  vpc_id         = aws_vpc.myvpc.id
  route_table_id = aws_route_table.myprivate.id

}

resource "aws_main_route_table_association" "public" {
  vpc_id         = aws_vpc.myvpc.id
  route_table_id = aws_route_table.mypublic.id

}