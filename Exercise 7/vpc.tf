resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virgigina_cidr
  tags = {
    Name = "vpc_private"
    name = "Private VPC"
    env  = "dev"
  }
}

resource "aws_subnet" "subnet_private" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets_list[0]

  tags = {
    Name = "Private subnet"
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets_list[1]
  map_public_ip_on_launch = true # Esta carecteristica hace que las ips realmente sea publicas

  tags = {
    Name = "Public subnet"
  }
}