terraform {
  backend "s3" {
    key    = "finops-landingzone"
    bucket = "anuj-tfbackend"
    region = "us-east-1"
  }
}
