locals {
  github_constants = {
    admins_team_id    = github_team.admins.id
    notadmins_team_id = github_team.notadmins.id
  }
}

variable "github_repository_constants" {
  type = map
}
