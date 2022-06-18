# Example DNS Zone files, taken for the condi.me domain
module "zones" {
  source    = "../../modules/repository"
  constants = var.constants

  name    = "zones"
  private = true
}
