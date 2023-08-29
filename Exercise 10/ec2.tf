resource "aws_instance" "public_instace" {
  ami                    = "ami-051f7e7f6c2f40dc1"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet_public.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.crta_public_subnet.id]
}
