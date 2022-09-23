resource "aws_iam_user" "driftctl" {
  name = "driftctl"
}

resource "aws_iam_user_policy_attachment" "driftctl" {
  user       = aws_iam_user.driftctl.name
  policy_arn = aws_iam_policy.driftctl.arn
}

resource "aws_iam_access_key" "driftctl" {
  user = aws_iam_user.driftctl.name
}

output "access_key_id" {
  value = aws_iam_access_key.driftctl.id
}

output "secret_access_key" {
  value = aws_iam_access_key.driftctl.secret
}
