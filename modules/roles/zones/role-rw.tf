resource "aws_iam_role" "rw" {
  name               = "zones"
  assume_role_policy = data.aws_iam_policy_document.assume-rw.json
}

# Only permit circleci for the matched repository to assume this role (via webidentity)
data "aws_iam_policy_document" "assume-rw" {
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

    condition {
      test     = "StringLike"
      variable = "oidc.circleci.com/org/${var.organization_id}:sub"

      # XXX: lock this down further? default branch?
      values = [
        "org/${var.organization_id}/project/${var.project_id}/user/*",
      ]
    }
  }
}

#resource "aws_iam_role_policy_attachment" "rw" {
#  role       = aws_iam_role.rw.name
#  policy_arn = aws_iam_policy.rw.arn
#}

resource "aws_iam_role_policy_attachment" "rwro" {
  role       = aws_iam_role.rw.name
  policy_arn = aws_iam_policy.ro.arn
}
