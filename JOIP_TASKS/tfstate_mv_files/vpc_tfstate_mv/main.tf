resource "aws_vpc" "myvpc" {
    cidr_block = "192.168.0.0/16"
    tags = {
      Name = "myvpc"
    }
}

resource "aws_subnet" "web" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "192.168.1.0/24"
}

resource "aws_subnet" "app" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "192.168.2.0/24"
}
resource "aws_subnet" "db" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "192.168.4.0/24" 
}