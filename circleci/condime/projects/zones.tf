module "zones-roles" {
  source = "../../../modules/roles/zones"

  circleci_oidc_provider_arn = local.aws_identity_provider_for_circleci
  organization_id            = local.organization_id
  project_id                 = local.zones_project_id
}
