# Meta repository, this repo manages itself!
module "meta-terraform-plans" {
  source    = "../../modules/repository"
  constants = var.constants

  name = "meta-terraform-plans"
}

# Grant GitHub Actions for this repository to access AWS resources
module "meta-terraform-plans-roles" {
  source = "../../modules/roles/meta-terraform-plans"

  github_oidc_provider_arn = local.aws_identity_provider_for_github
  github_repository        = module.meta-terraform-plans.github_repository
}
