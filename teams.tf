resource "github_team" "all" {
  for_each = {
    for team in csvdecode(file("teams.csv")) :
    team.name => team
  }

  name        = each.value.name
  description = each.value.description
  privacy     = each.value.privacy
}

resource "github_team_membership" "members" {
  for_each = { for tm in local.team_members : tm.name => tm }

  team_id  = each.value.team_id
  username = each.value.username
  role     = each.value.role
}

resource "github_team" "all_members" {
  name        = "all-members"
  description = "All organization members"
  privacy     = "closed"

}

resource "github_team_membership" "all_members" {
  for_each = {
    for member in csvdecode(file("members.csv")) :
    member.username => member
  }

  team_id  = "all-members"
  role     = "member"
  username = each.value.username
}
