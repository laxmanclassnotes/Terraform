terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.3.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  alias  = "red"
}

provider "aws" {
  region = "ap-south-1"
  alias  = "green"
}