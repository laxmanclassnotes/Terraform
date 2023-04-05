resource "aws_instance" "mytfec2" {
  ami                         = "ami-0fcf52bcf5db7b003"
  key_name                    = "my_key"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-0fd35704549e9148f"]
  provisioner "local-exec" {
   command = "echo HelloWorld"
  }
  tags = {
    Name = "HelloWorld"
  }
}