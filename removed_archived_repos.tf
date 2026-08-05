# github_issue_label and github_repository_ruleset are safe to guard with a
# plain count=0/empty for_each for archived repos: the underlying Terraform
# GitHub provider (v6.12.1) already handles deleting those two resource
# types gracefully against an archived repository (skips the delete, drops
# it from state). github_branch_protection and github_repository_environment
# are not -- their delete codepaths call the GitHub API directly with no
# archived-repo handling, so flipping their count/for_each to zero for an
# archived repo (in modules/common_repository/main.tf) would make Terraform
# attempt to destroy the existing resource with unverified behavior against
# an archived repo. `removed` blocks tell Terraform to stop managing these
# specific already-existing instances without ever issuing a delete.
#
# See the review discussion on osac-project/github-config#165 for the full
# analysis (CodeRabbit + follow-up).
#
# One block is required per already-archived repo, since `removed` targets
# a concrete resource address rather than a dynamic set.

removed {
  from = module.repo_fulfillment_service.github_branch_protection.repo_protection
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.repo_fulfillment_service.github_repository_environment.env
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.repo_cloudkit_operator.github_branch_protection.repo_protection
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.repo_cloudkit_operator.github_repository_environment.env
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.repo_cloudkit_aap.github_branch_protection.repo_protection
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.repo_cloudkit_aap.github_repository_environment.env
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.repo_osac_installer.github_branch_protection.repo_protection
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.repo_osac_installer.github_repository_environment.env
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.repo_osac_csi_driver.github_branch_protection.repo_protection
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.repo_osac_csi_driver.github_repository_environment.env
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.repo_host_management_openstack.github_branch_protection.repo_protection
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.repo_bare_metal_operator.github_branch_protection.repo_protection
  lifecycle {
    destroy = false
  }
}
