resource "aws_route53_record" "test_a_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.test_a_record
  type    = "A"
  ttl     = "300"
  records = [aws_instance.test.public_ip]
}

resource "aws_route53_record" "test_www_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.test_www_record
  type    = "A"
  ttl     = "300"
  records = [aws_instance.test.public_ip]
}