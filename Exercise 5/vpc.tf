resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virgigina_cidr
  tags = {
    Name = "vpc_private"
    name = "vpc_private"
    env  = "dev"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr
  tags = {
    Name = "vpc_private"
    name = "vpc_private"
    env  = "dev"
  }
  provider = aws.ohio
}