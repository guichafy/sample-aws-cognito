provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    bucket = "bucket-lab-states-terraform"
    key    = "states/api-gateway.json"
    region = "sa-east-1" 
  }
}
