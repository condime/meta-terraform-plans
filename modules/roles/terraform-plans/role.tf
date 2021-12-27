resource "aws_iam_role" "terraform-plans" {
  name               = "terraform-plans"
  assume_role_policy = data.aws_iam_policy_document.assume-terraform-plans.json
}

# Only permit github action workflows for the matched repository
# to assume this role (via webidentity)
data "aws_iam_policy_document" "assume-terraform-plans" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]

    principals {
      type        = "Federated"
      identifiers = [
        var.github_oidc_provider_arn,
      ]
    }

    # Match the specific repository
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:repositry"

      values = [
        var.github_repository,
      ]
    }

    # Match the workflow environment
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:environment"

      values = [
        "production",
      ]
    }

    # Match the default branch
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "repo:${var.github_repository}:ref:refs/heads/production",
      ]
    }
  }
}

variable "github_oidc_provider_arn" {}
variable "github_repository" {} # github-org/repo-name
