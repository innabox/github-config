resource "github_organization_settings" "innabox" {
  name                                         = "(AI [Factory]|Cloud) Inna Box"
  description                                  = "AI-enabled OpenShift clusters on bare metal -- on demand."
  billing_email                                = "lars@redhat.com"
  secret_scanning_enabled_for_new_repositories = true
  has_repository_projects                      = false

  members_can_create_private_repositories = false
  members_can_create_public_repositories  = false
  members_can_create_repositories         = false
}
