resource "aws_instance" "public_instace" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"
  tags          = var.tags
  subnet_id     = aws_subnet.subnet_public.id
}
