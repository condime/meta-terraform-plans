resource "aws_iam_policy" "terraform-plans" {
  name   = "terraform-plans"
  policy = data.aws_iam_policy_document.terraform-plans.json
}

data "aws_iam_policy_document" "terraform-plans" {
  statement {
    actions = [
      # S3 Tagging
      "s3:DeleteObjectTagging",
      "s3:DeleteObjectVersionTagging",
      "s3:PutBucketTagging",
      "s3:PutObjectTagging",
      "s3:PutObjectVersionTagging",
    ]

    resources = [
      "*",
    ]
  }
}
