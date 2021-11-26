resource "github_team" "admins" {
  name    = "admins"
  privacy = "closed"
}

resource "github_team_membership" "admins" {
  for_each = toset(local.admins)
  team_id  = github_team.admins.id
  username = each.key
  role     = "maintainer"
}

resource "github_team" "notadmins" {
  name    = "notadmin"
  privacy = "closed"
}

resource "github_team_membership" "notadmins" {
  for_each = toset(local.members)
  team_id  = github_team.notadmins.id
  username = each.key
  role     = "member"
}

resource "github_team_membership" "notadmin_maintainers" {
  for_each = toset(local.admins)
  team_id  = github_team.notadmins.id
  username = each.key
  role     = "maintainer"
}
