# Code of Conduct. How we interact with each other
module "code-of-conduct" {
  source    = "../../modules/repository"
  constants = var.constants

  name        = "code-of-conduct"
  description = "Code of Conduct for the condi.me Slack Group"
}
