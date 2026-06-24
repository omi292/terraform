output "publicIp" {
  value = aws_instance.name.public_ip
}

output "privateIP" {
  value = aws_instance.name.private_ip
}

output "az" {
  value = aws_instance.name.availability_zone
}