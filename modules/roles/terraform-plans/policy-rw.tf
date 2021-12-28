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

    resources = ["*"]
  }

  statement {
    actions = [
      "cognito-idp:TagResource",
      "cognito-idp:UntagResource",

      "cognito-idp:CreateUserPool",
      "cognito-idp:CreateUserPoolClient",
      "cognito-idp:CreateUserPoolDomain",
      "cognito-idp:CreateIdentityProvider",
      "cognito-idp:CreateGroup",

      "cognito-idp:DeleteUserPool",
      "cognito-idp:DeleteUserPoolClient",
      "cognito-idp:DeleteUserPoolDomain",
      "cognito-idp:DeleteIdentityProvider",
      "cognito-idp:DeleteGroup",
      "cognito-idp:DeleteUser",

      "cognito-idp:UpdateGroup",
      "cognito-idp:UpdateIdentityProvider",
      "cognito-idp:UpdateUserPool",
      "cognito-idp:UpdateUserPoolClient",
      "cognito-idp:UpdateUserPoolDomain",

      "iam:CreateOpenIDConnectProvider",
      "iam:DeleteOpenIDConnectProvider",
      "iam:UpdateOpenIDConnectProvider",

      "iam:TagOpenIDConnectProvider",
      "iam:UntagOpenIDConnectProvider",
    ]

    resources = ["*"]
  }
}
