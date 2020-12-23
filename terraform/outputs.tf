output "bastion_host" {
  value = aws_instance.bastion.public_dns
}

output "app_endpoint" {
  value = "https://${aws_route53_record.app.fqdn}"
}
