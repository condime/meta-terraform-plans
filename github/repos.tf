# Meta repository, manages itself!
module "meta-terraform-plans" {
  source    = "../modules/repository"
  constants = local.github_constants

  name = "meta-terraform-plans"
}

# Main repository, put your cool stuff here.
module "terraform-plans" {
  source    = "../modules/repository"
  constants = local.github_constants

  name = "terraform-plans"
}

# Secret repository, for secrets
module "secrets" {
  source    = "../modules/repository"
  constants = local.github_constants

  name        = "secrets"
  description = "Blackbox'd secrets"

  private = true
}

# Code of Conduct. How we interact with each other
module "code-of-conduct" {
  source    = "../modules/repository"
  constants = local.github_constants

  name        = "code-of-conduct"
  description = "Code of Conduct for the condi.me Slack Group"
}

# Example DNS Zone files, taken for the condi.me domain
module "zones" {
  source    = "../modules/repository"
  constants = local.github_constants

  name    = "zones"
  private = true
}
