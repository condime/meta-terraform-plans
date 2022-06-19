resource "aws_iam_policy" "ro" {
  name   = "zones-ro"
  policy = data.aws_iam_policy_document.ro.json
}

data "aws_iam_policy_document" "ro" {
  statement {
    actions = [
      "route53:GetHostedZone",
      "route53:ListHostedZones",
      "route53:ChangeResourceRecordSets",
      "route53:GetHostedZoneCount",
      "route53:GetHostedZoneLimit",
    ]

    resources = ["*"]
  }
}
