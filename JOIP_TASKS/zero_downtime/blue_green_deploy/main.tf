resource "aws_vpc" "my_redvpc" {
  cidr_block = "192.168.0.0/16"
  provider   = aws.red
    tags = {
    Name = "my_redvpc"
  }
}


resource "aws_vpc" "my_greenvpc" {
  cidr_block = "192.168.0.0/16"
  provider   = aws.green
  lifecycle {
    create_before_destroy = true
    replace_triggered_by = [
      aws_vpc.my_redvpc
    ]
  }
  tags = {
    Name = "my_greenvpc"
  }
}