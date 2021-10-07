# Meta repository, manages itself!
resource "github_repository" "meta-terraform-plans" {
  name = "meta-terraform-plans"

  has_issues   = true
  has_wiki     = false

  allow_merge_commit = false
  allow_rebase_merge = true
  allow_squash_merge = true

  vulnerability_alerts = true
}

# Main repository, put your cool stuff here.
resource "github_repository" "terraform-plans" {
  name = "terraform-plans"

  has_issues   = true
  has_wiki     = false

  allow_merge_commit = false
  allow_rebase_merge = true
  allow_squash_merge = true

  vulnerability_alerts = true
}

# Secret repository, for secrets
resource "github_repository" "secrets" {
  name        = "secrets"
  description = "Blackbox'd secrets"

  has_downloads = false
  has_issues    = true
  has_wiki      = false

  allow_merge_commit = false
  allow_rebase_merge = true
  allow_squash_merge = true

  vulnerability_alerts = true
}
