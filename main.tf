terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.63.0"
    }
  }
  backend "remote" {
    organization = "financini"

    workspaces {
      name = "financini_product"
    }
  }
}


provider "aws" {
  # Configuration options
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  region                  = "us-east-1"
}

resource "aws_instance" "web_app" {
  ami = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
}