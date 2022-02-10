resource "aws_security_group" "test" {
  name        = "test"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.dev_vpc.id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = merge(
      local.common_tags,
      tomap({
          "Name" = var.sg_name
      }))
}

# ssh rule
resource "aws_security_group_rule" "ssh_test1" {
    description         = "AllowSSH"
    type                = "ingress"
    from_port           = 22
    to_port             = 22
    protocol            = "tcp"
    cidr_blocks         = var.allow_ssh_cidr
    security_group_id   = aws_security_group.test.id
}

# http rule
resource "aws_security_group_rule" "http_test1" {
    description         = "HTTP"
    type                = "ingress"
    from_port           = 80
    to_port             = 80
    protocol            = "tcp"
    cidr_blocks         = var.allow_http_cidr
    security_group_id   = aws_security_group.test.id
}

# http rule
resource "aws_security_group_rule" "https_test1" {
    description         = "HTTP"
    type                = "ingress"
    from_port           = 443
    to_port             = 443
    protocol            = "tcp"
    cidr_blocks         = var.allow_https_cidr
    security_group_id   = aws_security_group.test.id
}