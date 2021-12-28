# This is the first user created in the account
# It needs to be created manually with an `iam:*` policy,
# which can then be imported into terraform state and reduced.
resource "aws_iam_role" "meta-terraform-plans-ro" {
  name               = "meta-terraform-plans-ro"
  assume_role_policy = data.aws_iam_policy_document.assume-meta-terraform-plans-ro.json
}

# Only permit github action workflows for the matched repository
# All branches and PRs are allowed
data "aws_iam_policy_document" "assume-meta-terraform-plans-ro" {
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

    # Match the specific repository
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:repository"

      values = [
        var.github_repository,
      ]
    }
  }
}

resource "aws_iam_role_policy_attachment" "meta-terraform-plans-ro" {
  role       = aws_iam_role.meta-terraform-plans-ro.name
  policy_arn = aws_iam_policy.meta-terraform-plans-ro.arn
}
