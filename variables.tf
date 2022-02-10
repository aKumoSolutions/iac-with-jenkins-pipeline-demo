# Default Tags
variable "env_tag" {
    description = "Environment for deployment"
    type = string
    default = "dev"
    validation {
        condition       = can(regex("^(dev|shs|prd)$", var.env_tag))
        error_message   = "Must be one of 'dev', 'stg', or 'prd' value."
    }
    
}
variable "project_tag" {}
variable "managed_tag" {
    type    = string
    default = "tf"
    validation {
        condition       = can(regex("^(tf|cf|manual)$", var.managed_tag))
        error_message   = "Must be one of 'tf', 'cf', or 'manual' value."
    }
}
variable "owner_tag" {}
variable "team_tag" {
    type    = string
    default = "infra"
    validation {
        condition       = can(regex("^(infra|app)$", var.team_tag))
        error_message   = "Must be one of 'infra' or 'app' value."
    }
}
variable "giturl_tag" {
    type    = string 
}
variable "backupname_tag" {
    type    = string
    default = "NA" 
}

# data.tf
variable "domain_name" {}

# sg.tf
variable "sg_name" {} 
variable "allow_ssh_cidr" {
    type    = list(string)
    default = [ "10.1.3.200/32" ] # bastion host
}
variable "allow_http_cidr" {
    type    = list(string)
    default = [ "10.1.3.200/32" ] # bastion host
}
variable "allow_https_cidr" {
    type    = list(string)
    default = [ "10.1.3.200/32" ] # bastion host
}

# ec2.tf
variable "instance_name" {}
variable "instance_type" {
    type    = string
    default = "t2.micro" 
}
variable "key_name" {}
variable "associate_public_ip_address" {
    type    = bool
    default = false
}
variable "delete_root_volume" {
    type    = bool
    default = false
}

# route53.tf
variable "test_a_record" {
    type = string
}
variable "test_www_record" {
    type = string
}