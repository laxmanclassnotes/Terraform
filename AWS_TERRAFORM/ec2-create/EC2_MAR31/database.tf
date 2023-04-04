resource "aws_security_group" "securitygr" {
  name        = "sgdefault"
  description = "allow tls inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "tls from vpc"
    from_port   = "0"
    to_port     = "65535"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "allow_tls"
  }
}

data "aws_subnets" "db" {
  filter {
    name   = "tag:Name"
    values = var.myvpc_info.db_subnets
  }
  filter {
    name   = "vpc-id"
    values = [aws_vpc.myvpc.id]
  }
  depends_on = [
    aws_subnet.subnets
  ]

}
resource "aws_db_subnet_group" "mydbsub" {
  name       = "mydbsub"
  subnet_ids = data.aws_subnets.db.ids
  depends_on = [
    aws_subnet.subnets
  ]
}
resource "aws_db_instance" "empdb" {
  allocated_storage      = 20
  db_name                = "mydb"
  db_subnet_group_name   = "mydbsub"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  instance_class         = "db.t2.micro"
  password               = "rootroot"
  username               = "admin"
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.securitygr.id]
  skip_final_snapshot    = true

  depends_on = [
    aws_db_subnet_group.mydbsub,
    aws_security_group.securitygr
  ]

}