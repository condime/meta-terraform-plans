resource "aws_iam_role_policy_attachment" "terraform-plans" {
  role       = aws_iam_role.terraform-plans.name
  policy_arn = aws_iam_policy.terraform-plans.arn
}

resource "aws_iam_policy" "terraform-plans" {
  name   = "terraform-plans"
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
