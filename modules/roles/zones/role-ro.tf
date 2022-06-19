resource "aws_iam_role" "ro" {
  name               = "zones-ro"
  assume_role_policy = data.aws_iam_policy_document.assume-ro.json
}

# Only permit circleci for the matched repository to assume this role (via webidentity)
data "aws_iam_policy_document" "assume-ro" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]

    principals {
      type = "Federated"
      identifiers = [
        var.circleci_oidc_provider_arn,
      ]
    }

    # https://circleci.com/docs/2.0/openid-connect-tokens#advanced-usage
    condition {
      test     = "StringLike"
      variable = "oidc.circleci.com/org/${var.organization_id}:sub"

      values = [
        "org/${var.organization_id}/project/${var.project_id}/user/*",
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "oidc.circleci.com/org/${var.organization_id}:aud"

      values = [
        var.organization_id
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "oidc.circleci.com/org/${var.organization_id}:oidc.circleci.com/project-id"

      values = [
        var.project_id
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "oidc.circleci.com/org/${var.organization_id}:oidc.circleci.com/context-ids"

      values = [
        var.read_only_context_id
      ]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ro" {
  role       = aws_iam_role.ro.name
  policy_arn = aws_iam_policy.ro.arn
}
