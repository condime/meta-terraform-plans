terraform {
  required_version = ">= 1.0"
  required_providers {
    consul = {
      source = "hashicorp/consul"
    }

    github = {
      source  = "integrations/github"
      version = "~> 4.19.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.70.0"
    }
  }

  backend "consul" {
    address = "consul.condi.me"
    scheme  = "https"
    path    = "condime/meta_terraform_state"
  }
}

provider "github" {
  owner = "condime"
}

provider "aws" {
  region = "eu-west-2"
}
