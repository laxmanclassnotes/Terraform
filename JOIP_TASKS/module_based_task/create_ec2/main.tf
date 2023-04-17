resource "aws_instance" "myec2" {
  ami                         = "ami-0fcf52bcf5db7b003"
  instance_type               = "t2.micro"
  key_name                    = "my_key"
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.first.id
  vpc_security_group_ids      = ["sg-0fd35704549e9148f"]
  tags = {
    Name = "myec2"
  }
}