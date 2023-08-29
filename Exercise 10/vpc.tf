resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virgigina_cidr
}

resource "aws_subnet" "subnet_private" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets_list[0]
}

resource "aws_subnet" "subnet_public" {
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.subnets_list[1]
  map_public_ip_on_launch = true # Esta carecteristica hace que las ips realmente sea publicas
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_virginia.id
  tags = {
    Name = "Internet gateway"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public ctr"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "crta_public_subnet" {
  name        = "Public instance sg"
  description = "Allow SSH inbound traffic and All egress traffic"
  vpc_id      = aws_vpc.vpc_virginia.id

  ingress {
    description = "SSH over Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Public instance sg"
  }
}
