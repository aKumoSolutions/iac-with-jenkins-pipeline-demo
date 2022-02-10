## Data source for common tags
data "aws_default_tags" "locals" {}

## Data source to read user_data.sh from scripts folder
data "template_file" "user_data" {
  template = file("scripts/user_data.yaml")
}

## Data source to get VPC details
data "aws_vpc" "dev_vpc" {
  filter {
      name = "tag:Name"
      values = [""] # <- VPC NAME
  }
}

## Data source to get Subnet details
data "aws_subnet" "pub_sub_1" {
  filter {
      name = "tag:Name"
      values = [""] # <- SUBNET NAME
  }
}

## Data source to get CentOS7 AMI id
data "aws_ami" "centos" {
owners      = ["aws-marketplace"]
most_recent = true
  filter {
      name   = "name"
      values = ["CentOS Linux 7*"]
  }
  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
  filter {
      name   = "architecture"
      values = ["x86_64"]
  }
}

data "aws_route53_zone" "selected" {
  name         = var.domain_name
}
