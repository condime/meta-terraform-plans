resource "github_repository" "repository" {
  name        = var.name
  description = var.description

  visibility = var.private ? "private" : "public"

  has_downloads = false
  has_issues    = false
  has_projects  = false
  has_wiki      = false

  delete_branch_on_merge = true
  allow_merge_commit     = true
  allow_rebase_merge     = true
  allow_squash_merge     = true

  vulnerability_alerts = true
}

resource "github_team_repository" "admins" {
  team_id    = var.constants["admins_team_id"]
  repository = github_repository.repository.name
  permission = "admin"
}

resource "github_team_repository" "notadmins" {
  team_id    = var.constants["notadmins_team_id"]
  repository = github_repository.repository.name
  permission = "triage"
}
