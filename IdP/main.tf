provider "aws" {
  region = "${var.region}"
}

# Modules 
module "Cognito" {
  source = "./Modules/Cognito"
}


terraform {
  backend "s3" {
    bucket = "bucket-lab-states-terraform"
    key    = "states/identity-provider.json"
    region = "sa-east-1" 
  }
}
