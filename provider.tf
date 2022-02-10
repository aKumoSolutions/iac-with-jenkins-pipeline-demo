provider "aws" {
  region = "us-east-1"
  assume_role {
  role_arn = "" # <- Enter Assume Role OR modify this to Access Key and Secret Key
  }
}