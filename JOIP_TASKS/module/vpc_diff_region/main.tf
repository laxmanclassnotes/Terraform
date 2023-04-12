module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"
  providers = {
    aws = aws.oregan
  }
  tags = {
    Name = "smallboy"
  }
}

module "vpc_1" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"
  providers = {
    aws = aws.hyderabad
  }
  tags = {
    Name = "fatboy"
  }
}