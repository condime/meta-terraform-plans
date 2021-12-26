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
