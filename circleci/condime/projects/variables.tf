locals {
  aws_identity_provider_for_circleci = var.constants.aws_identity_provider_for_circleci
  organization_id                    = var.constants.organization_id

  zones_project_id = "feed31c5-6360-43ad-acd5-1c2f990ff80a"
}

variable "constants" {
  type = map
}
