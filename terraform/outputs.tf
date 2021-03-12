output "app_endpoint" {
  value = "https://${aws_route53_record.app.fqdn}"
}
