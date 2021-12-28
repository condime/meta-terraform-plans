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
      type = "Federated"
      identifiers = [
        var.github_oidc_provider_arn,
      ]
    }

    # Match the specific repository on the `production` branch
    # or workflow_dispatch runs in the `production` environment
    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "repo:${var.github_repository}:ref:refs/heads/production",
        "repo:${var.github_repository}:environment:production",
      ]
    }
  }
}

resource "aws_iam_role_policy_attachment" "terraform-plans" {
  role       = aws_iam_role.terraform-plans.name
  policy_arn = aws_iam_policy.terraform-plans.arn
}

resource "aws_iam_role_policy_attachment" "terraform-plans-rwro" {
  role       = aws_iam_role.terraform-plans.name
  policy_arn = aws_iam_policy.terraform-plans-ro.arn
}
