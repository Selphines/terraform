output "WebServer_Instance_ID" {
  value = aws_instance.my_ubuntu.id
}

output "WebServer_Public_ip" {
  value = aws_eip.my_static_ip.public_ip
}
