# https://docs.driftctl.com/0.35.0/providers/aws/authentication/
resource "aws_iam_role" "driftctl" {
  name               = "driftctl"
  assume_role_policy = data.aws_iam_policy_document.assume-driftctl.json
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume-driftctl" {
  statement {
    effect = "Allow"
    actions   = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "driftctl" {
  role       = aws_iam_role.driftctl.name
  policy_arn = aws_iam_policy.driftctl.arn
}
