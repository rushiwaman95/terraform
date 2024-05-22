output "Webserver-Public-IP" {
  value = aws_instance.webserver.public_ip
}

output "ALB-DNS" {
  value = aws_lb.ALB.dns_name
}