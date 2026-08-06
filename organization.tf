resource "github_organization_settings" "osac-project" {
  name                                         = "Open Sovereign AI Cloud"
  description                                  = "Self service deployment of OpenShift clusters, virtual machines, and bare metal hosts"
  billing_email                                = "lars@redhat.com"
  secret_scanning_enabled_for_new_repositories = true
  has_repository_projects                      = false

  members_can_create_private_repositories = false
  members_can_create_public_repositories  = false
  members_can_create_repositories         = false
}

# Lets wg-infra manage self-hosted runners/runner groups at the org level
# (register/remove runners, create runner groups, control repo access to
# them) without granting full org-owner access. base_role defaults to
# "none", so this role carries only the permission listed below.
resource "github_organization_role" "runner_manager" {
  name        = "runner-manager"
  description = "Manage organization self-hosted runners and runner groups"

  permissions = [
    "manage_organization_runners",
  ]
}

resource "github_organization_role_team" "runner_manager_wg_infra" {
  role_id   = github_organization_role.runner_manager.role_id
  team_slug = github_team.all["wg-infra"].slug
}
