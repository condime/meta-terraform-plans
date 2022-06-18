module "repositories" {
  source    = "./repositories"
  constants = merge(var.github_repository_constants, local.github_constants)
}
