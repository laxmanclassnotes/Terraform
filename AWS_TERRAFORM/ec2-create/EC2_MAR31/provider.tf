terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
  required_version = "> 1.0.0"
}

provider "aws" {
  region = "us-west-2" # Configuration options
}