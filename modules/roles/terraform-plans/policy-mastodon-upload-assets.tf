resource "aws_iam_policy" "mastodon-upload-assets" {
  name   = "mastodon-upload-assets"
  policy = data.aws_iam_policy_document.mastodon-upload-assets.json
}

data "aws_iam_policy_document" "mastodon-upload-assets" {
  statement {
    actions = [
      "s3:AbortMultipartUpload",
      "s3:DeleteObject",
      "s3:DeleteObjectVersion",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
      "s3:GetBucketTagging",
      "s3:GetBucketVersioning",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:GetObjectAttributes",
      "s3:GetObjectRetention",
      "s3:GetObjectTagging",
      "s3:GetObjectVersion",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionTagging",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:ListBucketVersions",
      "s3:ListMultipartUploadParts",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:PutObjectRetention",
      "s3:PutObjectVersionAcl",
      "s3:RestoreObject",
    ]

    resources = [
      # github.com/condime/terraform-plans:eu-west-1/s3.tf
      "arn:aws:s3:::nfra-club",
      "arn:aws:s3:::nfra-club/*",
    ]
  }
}
