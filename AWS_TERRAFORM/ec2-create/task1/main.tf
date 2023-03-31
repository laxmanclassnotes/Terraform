resource "aws_key_pair" "my_id_rsa" {
  key_name   = "my_id_rsa.pem"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgw3ujUBjmI/Jaqf/EDqk1FQdS1eKjhKyaf9z4wvVJgNLwR+eW1/byOW8yWlZOi1DeEiBcCne4XamV9LhpyTHZo8UIg9tJ+whQdSVlbGRdWPKOOqQuUGepLDNA/j2IB4j/iBgEVWPyxpQqFnrltO0MO9bOc+l6nc0G/HD/LRolKDOdoM0rHCnquvATYholEwyeBZY97dxwOqRWsgabbs9394Nz1UMm2/XovehruYRHC2pLFqrJbydxBCFvvpXcxcoze3EnUbmHJV2rdbbGfavbayiyAK9LFyd3U9QIoHK3YgoieunyB/iMQGCQ85amiMZxV9eYphWEnvTVpRWUpJ0F316/Y0q1QToqRQK4vdaE41S5LOARTFiAD/Q7OeUhjFC3TQCmytzTBFRHWs/zDaw52qXstvCHOvKWDm/3dDTJZ9CnsFp/0yyC8PO0YciuWy9vy++rIgLk6EndVZf5AM8+QV2Rnf0/4FYqbN/ek3SCGuCZ8Yyn5mBr3t/hNAX/1E0= laxma@LAXMAN"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0fcf52bcf5db7b003"
  instance_type = "t3.micro"
}