resource "aws_iam_role" "mastodon-upload-assets" {
  name               = "mastodon-upload-assets"
  assume_role_policy = data.aws_iam_policy_document.assume-mastodon-upload-assets.json
}

# Only permit github actions workflows for the matched repository to assume this by webidentity
data "aws_iam_policy_document" "assume-mastodon-upload-assets" {
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

    # Match the specific repository and branch
    condition {
      test     = "ForAnyValue:StringLike"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "repo:${var.github_repository}:ref:*",
      ]
    }
  }
}

resource "aws_iam_role_policy_attachment" "mastodon-upload-assets" {
  role       = aws_iam_role.mastodon-upload-assets.name
  policy_arn = aws_iam_policy.mastodon-upload-assets.arn
}
