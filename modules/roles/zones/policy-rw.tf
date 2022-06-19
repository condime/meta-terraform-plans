resource "aws_iam_policy" "rw" {
  name   = "zones"
  policy = data.aws_iam_policy_document.rw.json
}

data "aws_iam_policy_document" "rw" {
  statement {
    actions = [
      "ec2:DescribeVpcs",
      "route53:CreateHostedZone",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "route53:ChangeResourceRecordSets",
    ]

    resources = ["*"]
  }
}
