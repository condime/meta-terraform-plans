# This is the first user and policy created in the account
# It needs to be created manually, but can then be imported into terraform state
resource "aws_iam_policy" "meta-terraform-plans" {
  name   = "meta-terraform-plans"
  policy = data.aws_iam_policy_document.meta-terraform-plans.json
}

data "aws_iam_policy_document" "meta-terraform-plans" {
  statement {
    actions = [
      "iam:*",
    ]

    resources = [
      "arn:aws:iam:::*",
    ]
  }
}

resource "aws_iam_user_policy_attachment" "meta-terraform-plans" {
  user       = aws_iam_user.meta-terraform-plans.name
  policy_arn = aws_iam_policy.meta-terraform-plans.arn
}

resource "aws_iam_user" "meta-terraform-plans" {
  name = "meta-terraform-plans"
}

resource "aws_iam_access_key" "meta-terraform-plans" {
  user = aws_iam_user.meta-terraform-plans.name
}

resource "github_actions_secret" "meta-terraform-plans-aws_access_key_id" {
  repository      = "meta-terraform-plans"
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = aws_iam_access_key.meta-terraform-plans.id
}

resource "github_actions_secret" "meta-terraform-plans-aws_secret_access_key" {
  repository      = "meta-terraform-plans"
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = aws_iam_access_key.meta-terraform-plans.secret
}
