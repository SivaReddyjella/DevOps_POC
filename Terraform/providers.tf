terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}


provider "aws" {
  profile = "default"
  export AWS_ACCESS_KEY_ID='AKIAQHZUKXXJZGQO2SOH'
  export AWS_SECRET_ACCESS_KEY='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'
  region  = "us-west-2"
}
