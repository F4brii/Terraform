resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virgigina_cidr
  tags       = var.tags
}

resource "aws_subnet" "subnet_private" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets_list[0]
  tags       = var.tags
}

resource "aws_subnet" "subnet_public" {
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.subnets_list[1]
  map_public_ip_on_launch = true # Esta carecteristica hace que las ips realmente sea publicas
  tags                    = var.tags
}
