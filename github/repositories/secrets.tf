# Secret repository, for secrets
module "secrets" {
  source    = "../../modules/repository"
  constants = var.constants

  name        = "secrets"
  description = "Blackbox'd secrets"

  private = true
}
