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
