terraform {
  required_providers {

    aws = {
      source = "hashicorp/aws"
      version = "~> 3.70.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 5.45.0"
    }
  }
}
