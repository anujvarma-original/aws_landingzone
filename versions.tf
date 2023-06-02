terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.67.0" # AFT module needs ">= 4.27.0, < 5.0.0"
    }
  }
  required_version = ">= 1.4.6"
}
