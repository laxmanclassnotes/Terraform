#resource "aws_vpc" "myvpc" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "myvpc"
#   }
# }
# resource "aws_subnet" "first" {
#   vpc_id     = aws_vpc.myvpc.id
#   cidr_block = "10.0.1.0/24"
#   tags = {
#     Name = "first_subnet"
#   }
# 
# }
resource "aws_default_vpc" "default" {
  tags = {
    Name = "default"
  }
  
}

resource "aws_instance" "myinstance" {
  ami                    = "ami-0fcf52bcf5db7b003"
  key_name               = "my-id"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0fd35704549e9148f"]
  user_data = filebase64("apache.sh") 
  tags = {
    Name = "red"
  }

}
