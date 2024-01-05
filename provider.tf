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

  app_auth {
    # https://github.com/organizations/condime/settings/apps/condime-meta-terraform-plans
    # https://github.com/organizations/condime/settings/installations/45795139
    id              = "783580"
    installation_id = "45795139"
    pem_file        = file("./secrets/private-key.pem")
  }
}

provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      ManagedBy = "condime/meta-terraform-plans"
    }
  }
}
