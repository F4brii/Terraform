resource "aws_vpc" "virtual_private_cloud" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "vpc_private"
    name = "vpc_private"
    env  = "dev"
  }
}

resource "aws_vpc" "virtual_private_cloud_ohio" {
  cidr_block = "10.20.0.0/16"
  tags = {
    Name = "vpc_private"
    name = "vpc_private"
    env  = "dev"
  }
  provider = aws.ohio
}
