resource "aws_instance" "myinstance1" {
  ami                    = "ami-0fcf52bcf5db7b003"
  key_name               = "my-id"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0fd35704549e9148f"]
  lifecycle {
    create_before_destroy = true
    replace_triggered_by = [
      aws_default_vpc.default.aws_instance.myinstance.id
    ]
  }
  tags = {
    Name = "green"
  }

}