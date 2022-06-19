module "projects" {
  source = "./projects"

  constants = merge(var.circleci_project_constants, local.circleci_constants)
}
