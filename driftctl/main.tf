module "driftctl-roles" {
  source = "../modules/roles/driftctl"
}

output "driftctl_user" {
  value = {
    access_key_id     = module.driftctl-roles.access_key_id
    secret_access_key = module.driftctl-roles.secret_access_key
  }
}
