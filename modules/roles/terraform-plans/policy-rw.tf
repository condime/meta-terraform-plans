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

  statement {
    actions = [
      "cognito-idp:ListIdentityProviders",
      "cognito-idp:ListTagsForResource",
      "cognito-idp:ListUserPools",
      "cognito-idp:ListUserPoolClients",
      "cognito-idp:ListUsers",
      "cognito-idp:ListGroups",
      "cognito-idp:ListUsersInGroup",

      "cognito-idp:DescribeIdentityProvider",
      "cognito-idp:DescribeUserPool",
      "cognito-idp:DescribeUserPoolClient",
      "cognito-idp:DescribeUserPoolDomain",
      "cognito-idp:GetUser",
      "cognito-idp:GetGroup",

      "cognito-idp:GetIdentityProviderByIdentifier",
      "cognito-idp:GetPoolMfaConfig",

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
    ]

    resources = [
      "*",
    ]
  }
}
