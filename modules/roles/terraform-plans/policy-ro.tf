resource "aws_iam_policy" "terraform-plans-ro" {
  name   = "terraform-plans-ro"
  policy = data.aws_iam_policy_document.terraform-plans-ro.json
}

data "aws_iam_policy_document" "terraform-plans-ro" {
  statement {
    actions = [
      "s3:Get*",
      "s3:List*",
      "s3-object-lambda:Get*",
      "s3-object-lambda:List*",
    ]

    resources = [
      "*",
    ]
  }
}
