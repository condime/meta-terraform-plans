# Main repository, put your cool stuff here.
module "terraform-plans" {
  source    = "../../modules/repository"
  constants = var.constants

  name = "terraform-plans"
}

# Grant GitHub Actions for this repository to access AWS resources
module "terraform-plans-roles" {
  source = "../../modules/roles/terraform-plans"

  github_oidc_provider_arn = local.aws_identity_provider_for_github
  github_repository        = module.terraform-plans.github_repository
}
