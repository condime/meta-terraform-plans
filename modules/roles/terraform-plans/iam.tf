resource "aws_iam_user_policy" "terraform-plans" {
  name   = "terraform-plans"
  user   = aws_iam_user.terraform-plans.name
  policy = data.aws_iam_policy_document.terraform-plans.json
}

data "aws_iam_policy_document" "terraform-plans" {
  statement {
    actions = [
      "s3:ListAllMyBuckets",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }
}

resource "aws_iam_user" "terraform-plans" {
  name = "terraform-plans"
}

resource "aws_iam_access_key" "terraform-plans" {
  user = aws_iam_user.terraform-plans.name
}

resource "github_actions_secret" "terraform-plans-aws_access_key_id" {
  repository      = "terraform-plans"
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = aws_iam_access_key.terraform-plans.id
}

resource "github_actions_secret" "terraform-plans-aws_secret_access_key" {
  repository      = "terraform-plans"
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = aws_iam_access_key.terraform-plans.secret
}
