module "repo_issues" {
  source      = "./modules/common_repository"
  name        = "issues"
  visibility  = "private"
  description = "Issues related to AI in a Box project"
}

module "repo_docs" {
  source              = "./modules/common_repository"
  name                = "docs"
  description         = "General documentation for the AI in a Box project"
  use_public_template = false
}

module "repo_dotgithub" {
  source              = "./modules/common_repository"
  name                = ".github"
  description         = "Profile README for innabox organization"
  use_public_template = false
}

module "repo_github_config" {
  source              = "./modules/common_repository"
  name                = "github-config"
  description         = "Repository for managing innabox github organization"
  use_public_template = false
  required_status_checks = [
    "pre-commit",
  ]
}

module "repo_hypershift_demo" {
  source              = "./modules/common_repository"
  name                = "hypershift-demo"
  description         = "Scripts used for the hypershift demo"
  use_public_template = false
}

module "repo_dotgithub_private" {
  source      = "./modules/common_repository"
  visibility  = "private"
  name        = ".github-private"
  description = "Member-only README for innabox organization"
}

module "repo_public_template" {
  source              = "./modules/common_repository"
  visibility          = "public"
  name                = "public_template"
  description         = "Use this repository as the template for public-facing repositories"
  use_public_template = false
  is_template         = true
}

module "repo_fulfillment_wg" {
  source      = "./modules/common_repository"
  visibility  = "public"
  name        = "fulfillment-wg"
  description = "Workspace for the fulfillment working group"
  teams = [
    {
      team_id    = "fulfillment-wg"
      permission = "push"
    }
  ]
}

module "repo_personas_wg" {
  source      = "./modules/common_repository"
  visibility  = "public"
  name        = "personas-wg"
  description = "Workspace for the personas working group"
  teams = [
    {
      team_id    = "personas-wg"
      permission = "push"
    }
  ]
}

module "repo_observability_wg" {
  source      = "./modules/common_repository"
  visibility  = "public"
  name        = "observability-wg"
  description = "Workspace for the observability working group"
  teams = [
    {
      team_id    = "observability-wg"
      permission = "push"
    }
  ]
}

module "repo_fulfillment_api" {
  source      = "./modules/common_repository"
  visibility  = "public"
  name        = "fulfillment-api"
  description = "Cloud-in-a-box fulfillment API"
  teams = [
    {
      team_id    = "fulfillment-wg"
      permission = "push"
    }
  ]
}

module "repo_hypershift_cluster_config" {
  source      = "./modules/common_repository"
  visibility  = "public"
  name        = "hypershift-cluster-config"
  description = "Configuration for OpenShift cluster running ACM w/ Hosted Control Planes"
  teams = [
    {
      team_id    = "fulfillment-wg"
      permission = "push"
    }
  ]
}
