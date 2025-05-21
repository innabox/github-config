module "repo_issues" {
  source                 = "./modules/common_repository"
  name                   = "issues"
  visibility             = "public"
  description            = "Issues related to AI in a Box project"
  use_public_template    = false
  all_members_permission = "push"
}

module "repo_docs" {
  source              = "./modules/common_repository"
  name                = "docs"
  description         = "General documentation for the AI in a Box project"
  use_public_template = false

  teams = [
    {
      team_id    = "documentation-wg"
      permission = "push"
    }
  ]
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

  pages = {
    build_type = "workflow"
  }
}

module "repo_managed_cluster_config" {
  source              = "./modules/common_repository"
  visibility          = "public"
  name                = "managed-cluster-config"
  use_public_template = false
  description         = "Configuration for OpenShift cluster running ACM w/ Hosted Control Planes"
  teams = [
    {
      team_id    = "fulfillment-wg"
      permission = "push"
    }
  ]
}

module "repo_managed_cluster_apps" {
  source      = "./modules/common_repository"
  visibility  = "public"
  name        = "managed-cluster-apps"
  description = "Argocd apps to deploy resources on the innabox cluster"
  teams = [
    {
      team_id    = "fulfillment-wg"
      permission = "push"
    }
  ]
}

module "repo_fulfillment_service" {
  source      = "./modules/common_repository"
  visibility  = "public"
  name        = "fulfillment-service"
  description = "Cloud-in-a-box fulfillment service"
  teams = [
    {
      team_id    = "fulfillment-wg"
      permission = "push"
    }
  ]
}

module "repo_cloudkit_operator" {
  source      = "./modules/common_repository"
  visibility  = "public"
  name        = "cloudkit-operator"
  description = "Cloud-in-a-box kubernetes operator"
  teams = [
    {
      team_id    = "fulfillment-wg"
      permission = "push"
    }
  ]
}

module "repo_cloudkit_aap" {
  source      = "./modules/common_repository"
  visibility  = "public"
  name        = "cloudkit-aap"
  description = "Cloud-in-a-box AAP configuration and playbooks"
  teams = [
    {
      team_id    = "fulfillment-wg"
      permission = "push"
    }
  ]
}

module "repo_fulfillment_cli" {
  source      = "./modules/common_repository"
  visibility  = "public"
  name        = "fulfillment-cli"
  description = "Cloud-in-a-box fulfillment CLI"
  teams = [
    {
      team_id    = "fulfillment-wg"
      permission = "push"
    }
  ]
}

module "repo_cloudkit_aap_ee" {
  source      = "./modules/common_repository"
  visibility  = "public"
  name        = "cloudkit-aap-ee"
  description = "Cloud-in-a-box execution environment for AAP"
  teams = [
    {
      team_id    = "fulfillment-wg"
      permission = "push"
    }
  ]
}

module "repo_cloudkit_operator_config" {
  source      = "./modules/common_repository"
  visibility  = "public"
  name        = "cloudkit-operator-config"
  description = "Configuration for our deployment of the cloudkit-operator"
  teams = [
    {
      team_id    = "fulfillment-wg"
      permission = "push"
    }
  ]
}
