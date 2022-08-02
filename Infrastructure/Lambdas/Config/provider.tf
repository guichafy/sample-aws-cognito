terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9"
    }
  }
  backend "s3" {
    bucket = "bucket-lab-states-terraform"
    key    = "states/sampleproject-lambda-config.json"
    region = "sa-east-1" 
  }
}

# Defining AWS provider
provider "aws" {
  region = var.aws_region
}