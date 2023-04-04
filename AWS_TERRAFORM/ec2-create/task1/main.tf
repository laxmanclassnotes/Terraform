resource "aws_key_pair" "my_id_rsa" {
  key_name   = "my_id_rsa.pem"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgw3ujUBjmI/Jaqf/EDqk1FQdS1eKjhKyaf9z4wvVJgNLwR+eW1/byOW8yWlZOi1DeEiBcCne4XamV9LhpyTHZo8UIg9tJ+whQdSVlbGRdWPKOOqQuUGepLDNA/j2IB4j/iBgEVWPyxpQqFnrltO0MO9bOc+l6nc0G/HD/LRolKDOdoM0rHCnquvATYholEwyeBZY97dxwOqRWsgabbs9394Nz1UMm2/XovehruYRHC2pLFqrJbydxBCFvvpXcxcoze3EnUbmHJV2rdbbGfavbayiyAK9LFyd3U9QIoHK3YgoieunyB/iMQGCQ85amiMZxV9eYphWEnvTVpRWUpJ0F316/Y0q1QToqRQK4vdaE41S5LOARTFiAD/Q7OeUhjFC3TQCmytzTBFRHWs/zDaw52qXstvCHOvKWDm/3dDTJZ9CnsFp/0yyC8PO0YciuWy9vy++rIgLk6EndVZf5AM8+QV2Rnf0/4FYqbN/ek3SCGuCZ8Yyn5mBr3t/hNAX/1E0= laxma@LAXMAN"
}

# create ec2 instance usin default vpc
resource "aws_instance" "myec2" {
  ami                         = "ami-0b584e5449fa1dd56"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.my_id_rsa.id
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.first.id
  user_data                   = file("apache.sh")
  vpc_security_group_ids      = ["sg-0b2560f23aaba5e98"]
  connection {
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    type        = "ssh"

  }
  provisioner "file" {
    source      = "apache.sh" # install nginx on ubuntu
    destination = "/tmp/apache.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/apache.sh",
      "/tmp/apache.sh args",
    ]
  }
  tags = {
    Name = "myec2"
  }

}
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# create default security group
resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# create loadbalancer

resource "aws_lb" "first" {
  name               = "terraform-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_default_security_group.default.id]
  subnets = [
    "${data.aws_subnet.first.id}",
    "${data.aws_subnet.second.id}",
  ]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

# create loadbalancer target group 
resource "aws_lb_target_group" "first" {
  name     = "myec2target"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
}

# create loadbalancer listener
resource "aws_lb_listener" "first" {
  load_balancer_arn = aws_lb.first.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.first.arn
  }
}

# attach to loadbalnacer target group
resource "aws_lb_target_group_attachment" "first" {
  target_group_arn = aws_lb_target_group.first.arn
  target_id        = aws_instance.myec2.id
  port             = 80
}