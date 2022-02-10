# common_tags.tf
env_tag         = "dev"
project_tag     = "test"
managed_tag     = "tf"
owner_tag       = "test"
team_tag        = "infra"
giturl_tag      = "testing"
backupname_tag  = "NA"

# data.tf
domain_name     = "" # <- Enter Domain Name

# sg.tf
sg_name         = "dev-test"
  # Allow SSH CIDRs
allow_ssh_cidr  = [
    "10.1.3.200/32",        # bastion host
    ]
  # Allow HTTP CIDRs
allow_http_cidr = [
    "10.1.3.200/32",        # bastion host
]
  # Allow HTTPS CIDRs
allow_https_cidr = [
    "10.1.3.200/32",        # bastion host
]

# ec2.tf
instance_name               = "dev-infra-ec2"
instance_type               = "t2.micro"
key_name                    = "" # <- Enter SSH Key Name
associate_public_ip_address = true
delete_root_volume          = true

# route53.tf
test_a_record               = "" # <- Enter Record Name
test_www_record             = "" # <- Enter Record Name  