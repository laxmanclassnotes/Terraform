terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
  required_version = "> 1.0.0"
  backend "s3" {
    bucket         = "terraforms3cf"
    key            = "class/hellos3"
    dynamodb_table = "terraformlock"
    region         = "ap-southeast-1"
  }
}

provider "aws" {
  # Configuration options
  region = "ap-southeast-1"
}