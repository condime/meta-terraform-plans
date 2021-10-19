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

  visibility           = "private"
  vulnerability_alerts = true
}

# Code of Conduct. How we interact with each other
resource "github_repository" "code-of-conduct" {
  name = "code-of-conduct"
  description = "Code of Conduct for the condi.me Slack Group"

  has_downloads = false
  has_issues    = false
  has_wiki      = false

  allow_merge_commit = true
  allow_rebase_merge = true
  allow_squash_merge = true

  vulnerability_alerts = false
}

# Example DNS Zone files, taken for the condi.me domain
resource "github_repository" "zones" {
  name = "zones"

  has_downloads = false
  has_issues    = false
  has_wiki      = false

  allow_merge_commit = false
  allow_rebase_merge = true
  allow_squash_merge = true

  visibility           = "private"
  vulnerability_alerts = false
}
