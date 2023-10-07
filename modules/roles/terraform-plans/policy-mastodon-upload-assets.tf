resource "aws_iam_policy" "mastodon-upload-assets" {
  name   = "mastodon-upload-assets"
  policy = data.aws_iam_policy_document.mastodon-upload-assets.json
}

data "aws_iam_policy_document" "mastodon-upload-assets" {
  statement {
    actions = [
      "s3:PutObject",
    ]

    resources = [
      # github.com/condime/terraform-plans:eu-west-1/s3.tf
      "arn:aws:s3:::nfra-club/*",
    ]
  }
}
