provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "bucket-lab-states-terraform"
    key    = "states/cognito.json"
    region = "sa-east-1" 
  }
}
