# This is the first user created in the account
# It needs to be created manually with an `iam:*` policy,
# which can then be imported into terraform state and reduced.
resource "aws_iam_user" "meta-terraform-plans" {
  name = "meta-terraform-plans"
}

resource "aws_iam_user_policy_attachment" "meta-terraform-plans" {
  user       = aws_iam_user.meta-terraform-plans.name
  policy_arn = aws_iam_policy.meta-terraform-plans.arn
}

resource "aws_iam_user_policy_attachment" "meta-terraform-plans-ro" {
  user       = aws_iam_user.meta-terraform-plans.name
  policy_arn = aws_iam_policy.meta-terraform-plans-ro.arn
}

resource "aws_iam_access_key" "meta-terraform-plans" {
  user = aws_iam_user.meta-terraform-plans.name
}

resource "github_actions_environment_secret" "meta-terraform-plans-aws_access_key_id" {
  repository      = "meta-terraform-plans"
  environment     = "production"
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = aws_iam_access_key.meta-terraform-plans.id
}

resource "github_actions_environment_secret" "meta-terraform-plans-aws_secret_access_key" {
  repository      = "meta-terraform-plans"
  environment     = "production"
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = aws_iam_access_key.meta-terraform-plans.secret

  # Note: Imported access keys do not store `secret` in the statefile
  # This will set this value to an empty string, unless terraform manages the access key
  lifecycle {
    ignore_changes = [
      plaintext_value
    ]
  }
}
