output "ec2_public_ip" {
  description = "Ip publica de la instancia"
  value       = aws_instance.public_instace.public_ip
}
