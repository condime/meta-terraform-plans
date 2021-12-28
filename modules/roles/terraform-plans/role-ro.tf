resource "aws_iam_role" "terraform-plans-ro" {
  name               = "terraform-plans-ro"
  assume_role_policy = data.aws_iam_policy_document.assume-terraform-plans-ro.json
}

# Only permit github action workflows for the matched repository
# to assume this role (via webidentity)
data "aws_iam_policy_document" "assume-terraform-plans-ro" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]

    principals {
      type = "Federated"
      identifiers = [
        var.github_oidc_provider_arn,
      ]
    }

    # Match the specific repository on the `production` branch
    # or workflow_dispatch runs in the `production` environment
    condition {
      test     = "ForAnyValue:StringLike"
      variable = "token.actions.githubusercontent.com:sub"

      # https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/about-security-hardening-with-openid-connect#examples
      values = [
        "repo:${var.github_repository}:ref:*",
        "repo:${var.github_repository}:pull_request",
      ]
    }
  }
}

resource "aws_iam_role_policy_attachment" "terraform-plans-ro" {
  role       = aws_iam_role.terraform-plans-ro.name
  policy_arn = aws_iam_policy.terraform-plans-ro.arn
}
