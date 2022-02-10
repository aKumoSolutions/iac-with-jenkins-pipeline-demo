terraform {
  backend "s3" {
    encrypt         = true  
    bucket          = "" # <- Enter Value
    dynamodb_table  = "" # <- Enter Value
    key             = "" # <- Enter Value
    region          = "" # <- Enter Value
  }
}
