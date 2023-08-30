terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.43.0"
    }
  }
}

#default provider
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
}
