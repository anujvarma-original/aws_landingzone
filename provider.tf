variable "region" {
  type    = string
  default = "us-east-1"
}
variable "profile" {
  type = string
}
variable "management_account" {
  type = string
}

provider "aws" {
  region              = var.region
  profile             = var.profile
  allowed_account_ids = [var.management_account]
}
