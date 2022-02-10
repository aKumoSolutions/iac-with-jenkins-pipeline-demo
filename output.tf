# Instance Public ip
output "test_ec_pub_ip" {
    description = "Test EC2 Public IP"
    value = aws_instance.test.public_ip
}

# Instance Public DNS
output "test_ec_aws_route53_record" {
    description = "Instance Public DNS"
    value = var.test_a_record
}