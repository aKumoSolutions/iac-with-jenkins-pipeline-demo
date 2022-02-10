resource "aws_instance" "test" {
  ami                           = data.aws_ami.centos.id
  instance_type                 = var.instance_type
  subnet_id                     = data.aws_subnet.pub_sub_1.id
  user_data                     = data.template_file.user_data.rendered
  key_name                      = var.key_name
  vpc_security_group_ids        = [aws_security_group.test.id]
  associate_public_ip_address   = var.associate_public_ip_address
  root_block_device {
    delete_on_termination       = var.delete_root_volume
  }
  tags = merge(
      local.common_tags,
      tomap({
          "Name" = var.instance_name
      }))
}