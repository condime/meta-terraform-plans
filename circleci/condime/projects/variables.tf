locals {
  aws_identity_provider_for_circleci = var.constants.aws_identity_provider_for_circleci
  organization_id                    = var.constants.organization_id

  read_only_context_id  = "c8e71188-0219-4c31-b064-5e6be8f070f8"
  read_write_context_id = "11576e16-98bd-4a33-bd2a-383de0ad1be0"
  zones_project_id      = "feed31c5-6360-43ad-acd5-1c2f990ff80a"
}

variable "constants" {
  type = map
}
