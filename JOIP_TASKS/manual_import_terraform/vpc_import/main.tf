resource "aws_vpc" "myvpc" {
  
}
resource "aws_instance" "myfirstec2" {
    ami = "ami-0fcf52bcf5db7b003"
    instance_type = "t2.nano"
    tags = {
      Name = "myfirstec2"
    }
  
}
resource "aws_instance" "mysecondec2" {
    ami = "ami-0fcf52bcf5db7b003"
    instance_type = "t2.nano"
    tags = {
      Name = "mysecondec2"
    }
  
}

resource "aws_lb" "myloadbal" {
  
}